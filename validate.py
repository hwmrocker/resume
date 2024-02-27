import difflib
import json
import os
import tempfile
from copy import copy
from enum import StrEnum
from pathlib import Path

import yaml
from pydantic import (
    AnyUrl,
    BaseModel,
    EmailStr,
    HttpUrl,
    PastDate,
    ValidationError,
    validator,
)
from pydantic.functional_validators import AfterValidator
from typing_extensions import Annotated
from yaml import SafeDumper, ScalarNode, add_representer, safe_dump, safe_load

resume_file = Path("src/data/resume-data.yaml")


def validate_address(v: list[str]) -> list[str]:
    if len(v) < 2:
        raise ValueError("address must have at least 2 items")
    return v


class Location(BaseModel):
    name: str
    osm_link: AnyUrl | None = None


class Basics(BaseModel):
    name: str
    mail: EmailStr
    phone: str | None = None
    post_address: Annotated[list[str], AfterValidator(validate_address)] = []


class Job(BaseModel):
    company: str
    description_de: str
    description_en: str
    start_date: PastDate
    end_date: PastDate | None = None
    locations: list[Location] = []
    technology: list[str] = []
    uid: str
    url: AnyUrl | None = None
    what_de: str
    what_en: str


class Edu(BaseModel):
    company: str
    degree: str | None = None
    start_date: PastDate
    end_date: PastDate | None = None
    locations: list[Location] = []
    uid: str
    url: AnyUrl | None = None
    technology: list[str] = []
    what_de: str
    what_en: str


class SkillLevel(StrEnum):
    beginner = "beginner"
    intermediate = "intermediate"
    advanced = "advanced"
    expert = "expert"

    @classmethod
    def _missing_(cls, value):
        return cls.beginner


class SkillCategory(StrEnum):
    language = "language"
    framework = "framework"
    tool = "tool"
    library = "library"
    database = "database"
    web_dev = "web_dev"
    backend = "backend"
    ops = "ops"
    data = "data"
    hero = "hero"
    cloud = "cloud"


class Period(BaseModel):
    start_date: PastDate
    end_date: PastDate | None = None


class Skill(BaseModel):
    name: str
    start_date: PastDate | None = None
    end_date: PastDate | None = None
    periods: list[Period] = []
    level: SkillLevel | None = None
    groups: list[SkillCategory] = []
    double_check: bool | None = None
    hide_me: bool | None = None


class Resume(BaseModel):
    basics: Basics
    education: list[Edu]
    experience: list[Job]
    skills: list[Skill]


def str_representer(dumper: SafeDumper, data) -> ScalarNode:
    return dumper.represent_str(str(data))


add_representer(AnyUrl, str_representer, SafeDumper)
add_representer(SkillCategory, str_representer, SafeDumper)
add_representer(SkillLevel, str_representer, SafeDumper)

described_skills = dict()


encountered_skills = set()
resume = Resume.model_validate(safe_load(resume_file.read_text()))

for skill in resume.skills:
    # described_skills.add(skill.name)
    if skill.start_date:
        p = Period(start_date=copy(skill.start_date), end_date=copy(skill.end_date))
        skill.periods.append(p)
        skill.start_date = None
        skill.end_date = None
    described_skills[skill.name] = skill

for job in resume.experience:
    for skill in job.technology:
        encountered_skills.add(skill)
        skillo = described_skills[skill]
        if skillo.double_check or not skillo.start_date:
            skillo.double_check = True
            p = Period(start_date=copy(job.start_date), end_date=copy(job.end_date))
            skillo.periods.append(p)

for edu in resume.education:
    for skill in edu.technology:
        encountered_skills.add(skill)

print(f"{len(encountered_skills)=}")
print(f"{len(described_skills)=}")
print("missing skills:")
for skill in sorted(encountered_skills - set(described_skills.keys())):
    print(skill)

# FILEPATH: /home/hwm/myspace/vue-resume/vue-resume/validate.py

# Create a temporary file
with (
    tempfile.NamedTemporaryFile(mode="w", delete=False) as temp_file,
    tempfile.NamedTemporaryFile(mode="w", delete=False) as temp_file2,
):
    temp_file.write(
        safe_dump(
            resume.model_dump(exclude_none=True),
            allow_unicode=True,
            sort_keys=False,
        )
    )
    temp_file2.write(
        safe_dump(
            yaml.safe_load(resume_file.read_text()),
        )
    )
    temp_filepath = temp_file.name
    temp_filepath2 = temp_file2.name

os.system(f"meld {temp_filepath2} {temp_filepath}")

# Use the temp_filepath as needed
# ...

# Remember to delete the temporary file when you're done
os.remove(temp_filepath2)
os.system(f"mv {temp_filepath} {resume_file.with_suffix('.new.yaml')}")
