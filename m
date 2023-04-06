Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDcK-0002ZX-Sl
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDcJ-0002ZA-Ds; Wed, 05 Apr 2023 20:36:43 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDcH-0008E3-Ix; Wed, 05 Apr 2023 20:36:43 -0400
Received: by mail-ua1-x934.google.com with SMTP id q8so19165314uas.7;
 Wed, 05 Apr 2023 17:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680741400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xapiIqMchVoMFAb68AR2e798+3Df9tFQ1WHgVma4Tdk=;
 b=bHfSasUXszr0nSAAzmrfT68jtSuKYIK28+CUuxZG97PqPU07dYP3eiS4WuwQ0V5x+J
 2KEn/fYr6IZxDgLRajIMaP0y+yOiYQTu4wwqQPQJKnhaqXaOF0xMS58/Equ8T1TC0aAi
 VyHiHwi3huEgVrfyIgTncic99l1q8INBi/ZduIUJcD+9d9Ie6AqSao168mVlnEKLIe3s
 vucZ02c7eboomzzCPhLZ/8x6mShb3caIYV1oXrewiKLdBm36yx5gndc9ZbtOB6OAm2Kb
 Ol3IuGOtmOjhbdDAyB7hCeFLba5pNn7P6RkS9YOL9U3O7PpT0XaHsooj2LnT705ec+sJ
 Kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680741400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xapiIqMchVoMFAb68AR2e798+3Df9tFQ1WHgVma4Tdk=;
 b=l50WVMk9wnWMioonMVfZWfegLHgRPGEIj+gkoCoYKOgiVBp4VYHado6yivlWQV4zFS
 JafruTjB7gWv2JtdkF3SIz40wPXrITm0SJlIjrSl9XRB5k6CuMOxME69+MQ0dj+98vL+
 XoyF/Gbr178ysPHRMEb5veCY6uQzw4ZoZR3ZFOFFvj3ABL48qzSHrELft3DySVPhgTY/
 BCS7JXLb+/KRtKkswoCQyscRQl6mPV3wSsZhrar65kdNNwwfDr63w9BE8d7ErwPEXj4o
 M3eVUcdONWGnu9ZVQf8KdExSSX5nUuBXqzriCTFPDivu02oi3Osoc8CdACOukn/ABK6E
 zu0Q==
X-Gm-Message-State: AAQBX9dBCtZ0OUJR0dXYvrV/dgJXmgZSE7hCnpf8cUxGtv/th+J9T6Jl
 KmXfoLs4kwRvwHtorUi8qhWsddxzEnhHfyfO7F0=
X-Google-Smtp-Source: AKy350YJVrEFjpHz17RRxw7a7MiJeoXcDwqYVXkmJeivRaAAXvSSOoJmEDUeTIdX/HnMrLNBH6fHu7rtRNcrp4B/jrM=
X-Received: by 2002:a1f:214e:0:b0:43c:6ef1:84d3 with SMTP id
 h75-20020a1f214e000000b0043c6ef184d3mr6065405vkh.0.1680741399819; Wed, 05 Apr
 2023 17:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
 <20230405095720.75848-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230405095720.75848-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:36:13 +1000
Message-ID: <CAKmqyKNCUY_AeUjUh=jbZ7aCJcS5TG7xgMpvUx7rQUuGZkv1qg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Apr 2023 00:36:43 -0000

On Wed, Apr 5, 2023 at 7:58=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Add signature and signature-granularity properties in spike to specify th=
e target
> signatrue file and the line size for signature data.
>
> Recgonize the signature section between begin_signature and end_signature=
 symbols
> when loading elf of ACT tests. Then dump signature data in signature sect=
ion just
> before the ACT tests exit.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  hw/char/riscv_htif.c         | 44 +++++++++++++++++++++++++++++++++++-
>  hw/riscv/spike.c             | 13 +++++++++++
>  include/hw/char/riscv_htif.h |  3 +++
>  3 files changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 098de50e35..37d3ccc76b 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -29,6 +29,8 @@
>  #include "chardev/char-fe.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/dma.h"
>
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                            =
       \
> @@ -51,7 +53,10 @@
>  /* PK system call number */
>  #define PK_SYS_WRITE            64
>
> -static uint64_t fromhost_addr, tohost_addr;
> +const char *sig_file;
> +uint8_t line_size =3D 16;
> +
> +static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_addr=
;
>
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
>                            uint64_t st_size)
> @@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int st_=
info, uint64_t st_value,
>              error_report("HTIF tohost must be 8 bytes");
>              exit(1);
>          }
> +    } else if (strcmp("begin_signature", st_name) =3D=3D 0) {
> +        begin_sig_addr =3D st_value;
> +    } else if (strcmp("end_signature", st_name) =3D=3D 0) {
> +        end_sig_addr =3D st_value;
>      }
>  }
>
> @@ -163,6 +172,39 @@ static void htif_handle_tohost_write(HTIFState *s, u=
int64_t val_written)
>              if (payload & 0x1) {
>                  /* exit code */
>                  int exit_code =3D payload >> 1;
> +
> +                /*
> +                 * Dump signature data if sig_file is specified and
> +                 * begin/end_signature symbols exist.
> +                 */
> +                if (sig_file && begin_sig_addr && end_sig_addr) {

There is no guarantee that these are initalised to zero, so this isn't
really checking anything is it?

Alistair

> +                    uint64_t sig_len =3D end_sig_addr - begin_sig_addr;
> +                    char *sig_data =3D g_malloc(sig_len);
> +                    dma_memory_read(&address_space_memory, begin_sig_add=
r,
> +                                    sig_data, sig_len, MEMTXATTRS_UNSPEC=
IFIED);
> +                    FILE *signature =3D fopen(sig_file, "w");
> +                    if (signature =3D=3D NULL) {
> +                        error_report("Unable to open %s with error %s",
> +                                     sig_file, strerror(errno));
> +                        exit(1);
> +                    }
> +
> +                    for (int i =3D 0; i < sig_len; i +=3D line_size) {
> +                        for (int j =3D line_size; j > 0; j--) {
> +                            if (i + j <=3D sig_len) {
> +                                fprintf(signature, "%02x",
> +                                        sig_data[i + j - 1] & 0xff);
> +                            } else {
> +                                fprintf(signature, "%02x", 0);
> +                            }
> +                        }
> +                        fprintf(signature, "\n");
> +                    }
> +
> +                    fclose(signature);
> +                    g_free(sig_data);
> +                }
> +
>                  exit(exit_code);
>              } else {
>                  uint64_t syscall[8];
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a584d5b3a2..2c5546560a 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -332,6 +332,11 @@ static void spike_board_init(MachineState *machine)
>                   htif_custom_base);
>  }
>
> +static void spike_set_signature(Object *obj, const char *val, Error **er=
rp)
> +{
> +    sig_file =3D g_strdup(val);
> +}
> +
>  static void spike_machine_instance_init(Object *obj)
>  {
>  }
> @@ -350,6 +355,14 @@ static void spike_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
>      mc->default_ram_id =3D "riscv.spike.ram";
> +    object_class_property_add_str(oc, "signature", NULL, spike_set_signa=
ture);
> +    object_class_property_set_description(oc, "signature",
> +                                          "File to write ACT test signat=
ure");
> +    object_class_property_add_uint8_ptr(oc, "signature-granularity",
> +                                        &line_size, OBJ_PROP_FLAG_WRITE)=
;
> +    object_class_property_set_description(oc, "signature-granularity",
> +                                          "Size of each line in ACT sign=
ature "
> +                                          "file");
>  }
>
>  static const TypeInfo spike_machine_typeinfo =3D {
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 5958c5b986..df493fdf6b 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -40,6 +40,9 @@ typedef struct HTIFState {
>      uint64_t pending_read;
>  } HTIFState;
>
> +extern const char *sig_file;
> +extern uint8_t line_size;
> +
>  /* HTIF symbol callback */
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
>      uint64_t st_size);
> --
> 2.25.1
>
>

