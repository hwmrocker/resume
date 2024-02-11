from pydantic import AnyUrl, BaseModel, HttpUrl
from yaml import Dumper, ScalarNode, add_representer, dump, safe_load


def url_representer(dumper: Dumper, data: AnyUrl) -> ScalarNode:
    return dumper.represent_str(str(data))


add_representer(AnyUrl, url_representer)


class MyModel(BaseModel):
    foo: int = 0
    url: HttpUrl


obj = MyModel.model_validate({"url": "https://www.example.com"})
print(obj)

serialized = dump(obj.model_dump()).strip()
print(serialized)

deserialized = MyModel.parse_obj(safe_load(serialized))
print(deserialized == obj and isinstance(deserialized.url, AnyUrl))
