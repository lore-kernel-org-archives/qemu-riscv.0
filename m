Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oYopG-0005bb-19
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 09:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oYoPj-0001BQ-O0; Thu, 15 Sep 2022 08:56:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:32976 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1oYoPg-0001p0-SK; Thu, 15 Sep 2022 08:56:19 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_2vhICNjbS8aAA--.33284S3; 
 Thu, 15 Sep 2022 20:56:01 +0800 (CST)
Subject: Re: [PATCH V4 1/3] hw/arm, loongarch: Move load_image_to_fw_cfg() to
 common location
To: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
 <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
 <YyMTpMuQ0UP9Mqaz@sunil-laptop>
From: gaosong <gaosong@loongson.cn>
Message-ID: <2ecd4eff-d0a4-a140-5dd5-b4de89040189@loongson.cn>
Date: Thu, 15 Sep 2022 20:56:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YyMTpMuQ0UP9Mqaz@sunil-laptop>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Dx_2vhICNjbS8aAA--.33284S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKFW3Zr4xAF13Jr4rJr15XFb_yoWxtw1xpF
 ZxGFnIyFWkXry3Kr12q34Y9Fy3Wr97Gr13X347GFyxtrnIyFn7KF1qkw1fuFW8urWUJa10
 vr109Fy3tF98JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-1.816, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Sep 2022 09:22:19 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2022 12:56:20 -0000


ÔÚ 2022/9/15 ÏÂÎç7:59, Sunil V L Ð´µÀ:
> Hi,
>
> Could maintainers of hw/arm and hw/loongarch to take a look at this? I
> have addressed Peter's earlier comment.
>
> Thanks
> Sunil
>
> On Thu, Sep 08, 2022 at 11:17:52AM +0200, Alistair Francis wrote:
>> On Tue, Sep 6, 2022 at 11:38 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>>> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
>>> function will be required by riscv too. So, it's time to refactor and
>>> move this function to a common path.
>>>
>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Alistair
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks
Song Gao
>>> ---
>>>   hw/arm/boot.c             | 49 ---------------------------------------
>>>   hw/loongarch/virt.c       | 33 --------------------------
>>>   hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>>>   include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>>>   4 files changed, 53 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>> index ada2717f76..704f368d9c 100644
>>> --- a/hw/arm/boot.c
>>> +++ b/hw/arm/boot.c
>>> @@ -818,55 +818,6 @@ static void do_cpu_reset(void *opaque)
>>>       }
>>>   }
>>>
>>> -/**
>>> - * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
>>> - *                          by key.
>>> - * @fw_cfg:         The firmware config instance to store the data in.
>>> - * @size_key:       The firmware config key to store the size of the loaded
>>> - *                  data under, with fw_cfg_add_i32().
>>> - * @data_key:       The firmware config key to store the loaded data under,
>>> - *                  with fw_cfg_add_bytes().
>>> - * @image_name:     The name of the image file to load. If it is NULL, the
>>> - *                  function returns without doing anything.
>>> - * @try_decompress: Whether the image should be decompressed (gunzipped) before
>>> - *                  adding it to fw_cfg. If decompression fails, the image is
>>> - *                  loaded as-is.
>>> - *
>>> - * In case of failure, the function prints an error message to stderr and the
>>> - * process exits with status 1.
>>> - */
>>> -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
>>> -                                 uint16_t data_key, const char *image_name,
>>> -                                 bool try_decompress)
>>> -{
>>> -    size_t size = -1;
>>> -    uint8_t *data;
>>> -
>>> -    if (image_name == NULL) {
>>> -        return;
>>> -    }
>>> -
>>> -    if (try_decompress) {
>>> -        size = load_image_gzipped_buffer(image_name,
>>> -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
>>> -    }
>>> -
>>> -    if (size == (size_t)-1) {
>>> -        gchar *contents;
>>> -        gsize length;
>>> -
>>> -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
>>> -            error_report("failed to load \"%s\"", image_name);
>>> -            exit(1);
>>> -        }
>>> -        size = length;
>>> -        data = (uint8_t *)contents;
>>> -    }
>>> -
>>> -    fw_cfg_add_i32(fw_cfg, size_key, size);
>>> -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
>>> -}
>>> -
>>>   static int do_arm_linux_init(Object *obj, void *opaque)
>>>   {
>>>       if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
>>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>>> index 5cc0b05538..eee2c193c0 100644
>>> --- a/hw/loongarch/virt.c
>>> +++ b/hw/loongarch/virt.c
>>> @@ -542,39 +542,6 @@ static void reset_load_elf(void *opaque)
>>>       }
>>>   }
>>>
>>> -/* Load an image file into an fw_cfg entry identified by key. */
>>> -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
>>> -                                 uint16_t data_key, const char *image_name,
>>> -                                 bool try_decompress)
>>> -{
>>> -    size_t size = -1;
>>> -    uint8_t *data;
>>> -
>>> -    if (image_name == NULL) {
>>> -        return;
>>> -    }
>>> -
>>> -    if (try_decompress) {
>>> -        size = load_image_gzipped_buffer(image_name,
>>> -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
>>> -    }
>>> -
>>> -    if (size == (size_t)-1) {
>>> -        gchar *contents;
>>> -        gsize length;
>>> -
>>> -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
>>> -            error_report("failed to load \"%s\"", image_name);
>>> -            exit(1);
>>> -        }
>>> -        size = length;
>>> -        data = (uint8_t *)contents;
>>> -    }
>>> -
>>> -    fw_cfg_add_i32(fw_cfg, size_key, size);
>>> -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
>>> -}
>>> -
>>>   static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
>>>   {
>>>       /*
>>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>>> index d605f3f45a..371a45dfe2 100644
>>> --- a/hw/nvram/fw_cfg.c
>>> +++ b/hw/nvram/fw_cfg.c
>>> @@ -41,6 +41,7 @@
>>>   #include "qapi/error.h"
>>>   #include "hw/acpi/aml-build.h"
>>>   #include "hw/pci/pci_bus.h"
>>> +#include "hw/loader.h"
>>>
>>>   #define FW_CFG_FILE_SLOTS_DFLT 0x20
>>>
>>> @@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
>>>       return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
>>>   }
>>>
>>> +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
>>> +                          uint16_t data_key, const char *image_name,
>>> +                          bool try_decompress)
>>> +{
>>> +    size_t size = -1;
>>> +    uint8_t *data;
>>> +
>>> +    if (image_name == NULL) {
>>> +        return;
>>> +    }
>>> +
>>> +    if (try_decompress) {
>>> +        size = load_image_gzipped_buffer(image_name,
>>> +                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
>>> +    }
>>> +
>>> +    if (size == (size_t)-1) {
>>> +        gchar *contents;
>>> +        gsize length;
>>> +
>>> +        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
>>> +            error_report("failed to load \"%s\"", image_name);
>>> +            exit(1);
>>> +        }
>>> +        size = length;
>>> +        data = (uint8_t *)contents;
>>> +    }
>>> +
>>> +    fw_cfg_add_i32(fw_cfg, size_key, size);
>>> +    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
>>> +}
>>>
>>>   static void fw_cfg_class_init(ObjectClass *klass, void *data)
>>>   {
>>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>>> index 0e7a8bc7af..c1f81a5f13 100644
>>> --- a/include/hw/nvram/fw_cfg.h
>>> +++ b/include/hw/nvram/fw_cfg.h
>>> @@ -342,4 +342,25 @@ bool fw_cfg_dma_enabled(void *opaque);
>>>    */
>>>   const char *fw_cfg_arch_key_name(uint16_t key);
>>>
>>> +/**
>>> + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
>>> + *                          by key.
>>> + * @fw_cfg:         The firmware config instance to store the data in.
>>> + * @size_key:       The firmware config key to store the size of the loaded
>>> + *                  data under, with fw_cfg_add_i32().
>>> + * @data_key:       The firmware config key to store the loaded data under,
>>> + *                  with fw_cfg_add_bytes().
>>> + * @image_name:     The name of the image file to load. If it is NULL, the
>>> + *                  function returns without doing anything.
>>> + * @try_decompress: Whether the image should be decompressed (gunzipped) before
>>> + *                  adding it to fw_cfg. If decompression fails, the image is
>>> + *                  loaded as-is.
>>> + *
>>> + * In case of failure, the function prints an error message to stderr and the
>>> + * process exits with status 1.
>>> + */
>>> +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
>>> +                          uint16_t data_key, const char *image_name,
>>> +                          bool try_decompress);
>>> +
>>>   #endif
>>> --
>>> 2.25.1
>>>
>>>


