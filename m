Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvCn-0006AD-9v
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvCm-00069y-1D; Wed, 05 Apr 2023 00:57:08 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvCj-0002st-7S; Wed, 05 Apr 2023 00:57:07 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id d18so30418760vsv.11;
 Tue, 04 Apr 2023 21:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680670623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mfv1r7vERFJNO/pxSOiF7dpfreqJu6/GDUsOpEMZwwA=;
 b=j7vd+BQVcMNkvKhe6TlnNMPsyn7jDqFutZEO+lS+qjyJOa/8UrmudwghpdvU6CFGzZ
 Q2D66w0k7TNFIM8I9c+Vrj560/kZjjAcaCjKs4J2IjAi/vuAXJOVaYk0+BN3Bq26GNn0
 +rJweEUOm0jDxLG17mzy1eEzAOuPP4/5X7KpYqPeGiyHtm86zPkWEB5SQ4BE/tN6rpBn
 APQWfE/rZW1C7hL4YmdPU201irfGfLpjOE3L/1Zbdy+GJSQfcNZ4dDJMXDaxuPNaTWsQ
 W+gp0RSnlHiM65dSdPUvVqyPVi/U7X0eTcfP2D26PRnwo6wSgyfpCSa1i/DaWzU0IJ/S
 SBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680670623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mfv1r7vERFJNO/pxSOiF7dpfreqJu6/GDUsOpEMZwwA=;
 b=saon+n0/I3NE486E/qh2aZbLUtmLqBsq/6e/q7B6hgylrCVaYOss4c/OmDdr1xaAUc
 fWY9n/EJmGxYA6FCNYB8XKIUeRFNsobPD+gCB5acmOdmTlR/VwPXhxmgujlYCyMoR78c
 /jxxWynKEkTSq06Hi/qiKpHy6Vh+OZteubxTkIXAIEpg+y588+mwnMj9wp6Jj330Jnzy
 urfpV/r3xK8dgH12CqwMsiGdufprpHH5bJfZgJ5ufEAschXKoFL4oc+kf33LztXZn4kC
 CjR4fb0Dz9yA6KzmQSHb8QvN8jIDd+yP8uKSRH57m84ftaXEbdhG9K54U2SEcjWtBYSA
 bAWQ==
X-Gm-Message-State: AAQBX9dYgx4i+NG6MSBz5BB4Uy/2sjqwFO9Zf5fdU53lw9iblFOsfRVn
 2i6teImZdQ0wTU4da2wpFTQ6Aa789tPP+5y2O00=
X-Google-Smtp-Source: AKy350ZMf0mDIPHlvLJjHWSRaidFBnF8eZ2ZnSLVO0ZNzn2WMXNXEGL5UHZTx+2YaGvZSDGFxL8dRDykCeRLrfyKnWs=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr3625607vsk.3.1680670623531; Tue, 04 Apr
 2023 21:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230307032915.10059-1-liweiwei@iscas.ac.cn>
 <20230307032915.10059-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230307032915.10059-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:56:37 +1000
Message-ID: <CAKmqyKNpJSgitgisF9wDU_-m7dOkHDP8uOnhJVbkFRR6t_auNw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:57:08 -0000

On Tue, Mar 7, 2023 at 1:30=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
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
>  hw/char/riscv_htif.c         | 39 +++++++++++++++++++++++++++++++++++-
>  hw/riscv/spike.c             | 13 ++++++++++++
>  include/hw/char/riscv_htif.h |  3 +++
>  3 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 098de50e35..297c98c215 100644
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
> +static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
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
> +        sig_addr =3D st_value;
> +    } else if (strcmp("end_signature", st_name) =3D=3D 0) {
> +        sig_len =3D st_value - sig_addr;

What if sig_addr isn't initialised, won't this give us a really wrong lengt=
h?

We should have a default address or check that it has been set

>      }
>  }
>
> @@ -161,6 +170,34 @@ static void htif_handle_tohost_write(HTIFState *s, u=
int64_t val_written)
>          /* frontend syscall handler, shutdown and exit code support */
>          if (cmd =3D=3D HTIF_SYSTEM_CMD_SYSCALL) {
>              if (payload & 0x1) {
> +                /* Dump signature data to sig_file if specified */
> +                if (sig_file) {
> +                    char *sig_data =3D g_malloc(sig_len);
> +                    dma_memory_read(&address_space_memory, sig_addr, sig=
_data,
> +                                    sig_len, MEMTXATTRS_UNSPECIFIED);
> +                    FILE *signature =3D fopen(sig_file, "w");
> +                    if (signature =3D=3D NULL) {
> +                        error_report("open %s: %s", sig_file,

The error should be "Unable to open %s with error %s" to be more clear

Alistair

> +                                     strerror(errno));
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
>                  /* exit code */
>                  int exit_code =3D payload >> 1;
>                  exit(exit_code);
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

