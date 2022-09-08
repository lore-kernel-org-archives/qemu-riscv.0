Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDgI-00057d-AP
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDg1-00055c-W1; Thu, 08 Sep 2022 05:18:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDfz-0000ZA-By; Thu, 08 Sep 2022 05:18:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 202so16123786pgc.8;
 Thu, 08 Sep 2022 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1WnIjNwI9zoKvVs4j+13H9KpRiLH13O2IcEA77P6lDM=;
 b=AKThRNAfAvBJo1N8uVU8w4a0P7qYfJWo+j/z8wB/KQFsddaVm+Bm05kj0xi7kSsydo
 MkQxiw+9w2SzNbXO096qZ9vcaGntP1IvEk1qAfHwBjg86cbDBTYdMcqe8pH8Rz4lEs0j
 w8rfoRkzYYjoSJon69Mc+Rhow/3vlditfVXb3XSzuBAv3psYUSdyv2pcD0G+pRS2cIH7
 ah7tBPmGGz+3e7QUE0MnFdtHalij7/QCr/MD2gRwFiEovdxjjImgDrJsreHIFx04XBS/
 ORzFGz0WBQ4RZ3cEubjLNCMYv3DYHplXQuTfE8RTWcdTDODbcc2fnaDnUFbuhrsLOZdw
 968w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1WnIjNwI9zoKvVs4j+13H9KpRiLH13O2IcEA77P6lDM=;
 b=zlQUacZLYsYkYkU9J15VvjoqZVW7kaYKSrKz9a0VlibVULvjJRW8riYGm6+0M4TWHN
 QzBv0mWZN9kB5GOrOIkWFBu74wQNcqGIg9yhtR1XHtQpfv36MC0LPEHKUjZ4bLmQZd/H
 dpyY63oqameWKz8e41E+j/ffYVTrhrxjZEcKImAo/oOAn66fGZ8QgCcCHzOkyq9Cw1nK
 0Qs8/5cRN+2gLuU8SmSvKcXiz6r7QV3QZ37k5DXxXU2XNgn0V+v8A5dhs/8QfvzofSBM
 o8rPq7i5OnxXKdwcJ7O3wCqSH5p5Iez/R9kccw1aeA3YATPuNx9bSlX2zmTRlm5xF4s/
 KgSQ==
X-Gm-Message-State: ACgBeo2EhTfnN2eOs+F8O3qTBD8IfAoTuC9I0qzOsqFzGTFQuZVh13OD
 HgonmjuxYdeqNewzr2UtORy2wjI9/z4Ink+RLo4=
X-Google-Smtp-Source: AA6agR6CVpFcjMyjZMpJrwhWVfTWnpDm8nUFXR/zjRqH8aOECTJ/m2B/V8JfNOete6lkWwRkztbSi3dbJ8F+qQtP+Co=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr8263358pfh.60.1662628699699; Thu, 08 Sep
 2022 02:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
In-Reply-To: <20220906090219.412517-2-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:17:52 +0200
Message-ID: <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] hw/arm, loongarch: Move load_image_to_fw_cfg() to
 common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 08 Sep 2022 09:18:37 -0000

On Tue, Sep 6, 2022 at 11:38 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>  4 files changed, 53 insertions(+), 82 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..704f368d9c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -818,55 +818,6 @@ static void do_cpu_reset(void *opaque)
>      }
>  }
>
> -/**
> - * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> - *                          by key.
> - * @fw_cfg:         The firmware config instance to store the data in.
> - * @size_key:       The firmware config key to store the size of the loaded
> - *                  data under, with fw_cfg_add_i32().
> - * @data_key:       The firmware config key to store the loaded data under,
> - *                  with fw_cfg_add_bytes().
> - * @image_name:     The name of the image file to load. If it is NULL, the
> - *                  function returns without doing anything.
> - * @try_decompress: Whether the image should be decompressed (gunzipped) before
> - *                  adding it to fw_cfg. If decompression fails, the image is
> - *                  loaded as-is.
> - *
> - * In case of failure, the function prints an error message to stderr and the
> - * process exits with status 1.
> - */
> -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> -                                 uint16_t data_key, const char *image_name,
> -                                 bool try_decompress)
> -{
> -    size_t size = -1;
> -    uint8_t *data;
> -
> -    if (image_name == NULL) {
> -        return;
> -    }
> -
> -    if (try_decompress) {
> -        size = load_image_gzipped_buffer(image_name,
> -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> -    }
> -
> -    if (size == (size_t)-1) {
> -        gchar *contents;
> -        gsize length;
> -
> -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> -            error_report("failed to load \"%s\"", image_name);
> -            exit(1);
> -        }
> -        size = length;
> -        data = (uint8_t *)contents;
> -    }
> -
> -    fw_cfg_add_i32(fw_cfg, size_key, size);
> -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> -}
> -
>  static int do_arm_linux_init(Object *obj, void *opaque)
>  {
>      if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 5cc0b05538..eee2c193c0 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -542,39 +542,6 @@ static void reset_load_elf(void *opaque)
>      }
>  }
>
> -/* Load an image file into an fw_cfg entry identified by key. */
> -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> -                                 uint16_t data_key, const char *image_name,
> -                                 bool try_decompress)
> -{
> -    size_t size = -1;
> -    uint8_t *data;
> -
> -    if (image_name == NULL) {
> -        return;
> -    }
> -
> -    if (try_decompress) {
> -        size = load_image_gzipped_buffer(image_name,
> -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> -    }
> -
> -    if (size == (size_t)-1) {
> -        gchar *contents;
> -        gsize length;
> -
> -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> -            error_report("failed to load \"%s\"", image_name);
> -            exit(1);
> -        }
> -        size = length;
> -        data = (uint8_t *)contents;
> -    }
> -
> -    fw_cfg_add_i32(fw_cfg, size_key, size);
> -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> -}
> -
>  static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
>  {
>      /*
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..371a45dfe2 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -41,6 +41,7 @@
>  #include "qapi/error.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/loader.h"
>
>  #define FW_CFG_FILE_SLOTS_DFLT 0x20
>
> @@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
>      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
>  }
>
> +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> +                          uint16_t data_key, const char *image_name,
> +                          bool try_decompress)
> +{
> +    size_t size = -1;
> +    uint8_t *data;
> +
> +    if (image_name == NULL) {
> +        return;
> +    }
> +
> +    if (try_decompress) {
> +        size = load_image_gzipped_buffer(image_name,
> +                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> +    }
> +
> +    if (size == (size_t)-1) {
> +        gchar *contents;
> +        gsize length;
> +
> +        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> +            error_report("failed to load \"%s\"", image_name);
> +            exit(1);
> +        }
> +        size = length;
> +        data = (uint8_t *)contents;
> +    }
> +
> +    fw_cfg_add_i32(fw_cfg, size_key, size);
> +    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> +}
>
>  static void fw_cfg_class_init(ObjectClass *klass, void *data)
>  {
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 0e7a8bc7af..c1f81a5f13 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -342,4 +342,25 @@ bool fw_cfg_dma_enabled(void *opaque);
>   */
>  const char *fw_cfg_arch_key_name(uint16_t key);
>
> +/**
> + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> + *                          by key.
> + * @fw_cfg:         The firmware config instance to store the data in.
> + * @size_key:       The firmware config key to store the size of the loaded
> + *                  data under, with fw_cfg_add_i32().
> + * @data_key:       The firmware config key to store the loaded data under,
> + *                  with fw_cfg_add_bytes().
> + * @image_name:     The name of the image file to load. If it is NULL, the
> + *                  function returns without doing anything.
> + * @try_decompress: Whether the image should be decompressed (gunzipped) before
> + *                  adding it to fw_cfg. If decompression fails, the image is
> + *                  loaded as-is.
> + *
> + * In case of failure, the function prints an error message to stderr and the
> + * process exits with status 1.
> + */
> +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> +                          uint16_t data_key, const char *image_name,
> +                          bool try_decompress);
> +
>  #endif
> --
> 2.25.1
>
>

