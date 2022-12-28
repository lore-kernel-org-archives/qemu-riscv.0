Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAOBA-0002kL-VZ
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 23:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAOB1-0002je-3d; Tue, 27 Dec 2022 23:36:27 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAOAy-00014z-3O; Tue, 27 Dec 2022 23:36:25 -0500
Received: by mail-ua1-x92f.google.com with SMTP id q3so2537643uao.2;
 Tue, 27 Dec 2022 20:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DLNYJzGRLnjtNR4T5XuYRIR7rcNohA3Zjt4JKbnfvf0=;
 b=kdOoX28ro4O7voblLnH94/PTcTd3MAeLEPDip7AnA9+MjcR1zDmM/zUAoa7w/wpIfs
 WRPU4O18qJYX4Dz29VQrBBp7G9iF5MnL+EsvecZQzdMn8GBayiDxiQ/VpziPYzKoxA9t
 tEI56KoYpRE2a045PZL12zQ4k5W+//gHj5mIwe1ZLO6vZRKmYXrz9bhOFshZiymb8qDm
 SooWvxJsTUUAFGgIa86t/W1ePsRNTVHLE1gXj99Ae1mSh3ogSfWI1KKomnNjnyrhjcOt
 9Lp86Co3+O5gaLGsXhu77dii9jhfsd3K6FLhRSCa1oCJbG+8a4RsjvUovWAsewDvJ/BO
 Vmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DLNYJzGRLnjtNR4T5XuYRIR7rcNohA3Zjt4JKbnfvf0=;
 b=lCutelBP/oW/a3WbtOopX9wZI5AuJOqxbvQo1gybbplY5Rmld5Jf26wBIErz8qn4/e
 w2r+2gdgzM/35bMbwElq60gyojiW9D5RNEten1MNxAWvCtZa27FJi94uXZ4yowgOURE8
 EZZsbohR1Vw2RLkYXijFSHfqGSW0cvd8k+IYITkczJjuxWUJVReRMhm9EiLCeD9onXq3
 X2O9cRcJZ4P2sLZNTCKWshqIjPmI7fIhctrhZjd8yyEx3k/bBDfJKQZW1ltDYkEWRhYE
 SyHbNtomzJR4jA5HpfMuzgFHVccXBp5JtoIdeOCN46KAYrJJewkxUwDHLcuLswITwr1l
 j3/w==
X-Gm-Message-State: AFqh2kot0+afITVAlSsTLkhebOhQUoOyVQFtcbzQW5wJeSZ4yBm+oaeV
 588sePwklIGoR9md5/71O0RU5Ln6SXESv9WF/7o=
X-Google-Smtp-Source: AMrXdXsVGxxbhbyMHctvCo+ikVlkaM6qotk8IiwkIui3lEO1u1BcRGak4xopSrtwa8DdthrOy1BoXz4btDtiX+uqe2k=
X-Received: by 2002:ab0:6812:0:b0:43f:487c:b2fb with SMTP id
 z18-20020ab06812000000b0043f487cb2fbmr2134707uar.96.1672202182418; Tue, 27
 Dec 2022 20:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-12-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-12-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:35:56 +1000
Message-ID: <CAKmqyKPBQ98YN6HA3kREW2QWovU5FZJAva29__6RwLz3auOLSA@mail.gmail.com>
Subject: Re: [PATCH 11/12] hw/riscv/boot.c: Introduce riscv_find_firmware()
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 04:36:28 -0000

On Tue, Dec 27, 2022 at 4:55 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Rename previous riscv_find_firmware() to riscv_find_bios(), and
> introduce a new riscv_find_firmware() to implement the first half
> part of the work done in riscv_find_and_load_firmware().
>
> This new API is helpful for machine that wants to know the final
> chosen firmware file name but does not want to load it.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/boot.h |  2 ++
>  hw/riscv/boot.c         | 39 +++++++++++++++++++++++++--------------
>  2 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 60cf320c88..b273ab22f7 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -38,6 +38,8 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            hwaddr firmware_load_addr,
>                                            symbol_fn_t sym_cb);
>  const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
> +char *riscv_find_firmware(const char *firmware_filename,
> +                          const char *default_machine_firmware);
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e1a544b1d9..98b80af51b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -84,11 +84,11 @@ const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
>      return RISCV64_BIOS_BIN;
>  }
>
> -static char *riscv_find_firmware(const char *firmware_filename)
> +static char *riscv_find_bios(const char *bios_filename)
>  {
>      char *filename;
>
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_filename);
>      if (filename == NULL) {
>          if (!qtest_enabled()) {
>              /*
> @@ -97,8 +97,8 @@ static char *riscv_find_firmware(const char *firmware_filename)
>               * running QEMU test will complain hence let's suppress the error
>               * report for QEMU testing.
>               */
> -            error_report("Unable to load the RISC-V firmware \"%s\"",
> -                         firmware_filename);
> +            error_report("Unable to find the RISC-V BIOS \"%s\"",
> +                         bios_filename);
>              exit(1);
>          }
>      }
> @@ -106,25 +106,36 @@ static char *riscv_find_firmware(const char *firmware_filename)
>      return filename;
>  }
>
> -target_ulong riscv_find_and_load_firmware(MachineState *machine,
> -                                          const char *default_machine_firmware,
> -                                          hwaddr firmware_load_addr,
> -                                          symbol_fn_t sym_cb)
> +char *riscv_find_firmware(const char *firmware_filename,
> +                          const char *default_machine_firmware)
>  {
> -    char *firmware_filename = NULL;
> -    target_ulong firmware_end_addr = firmware_load_addr;
> +    char *filename = NULL;
>
> -    if ((!machine->firmware) || (!strcmp(machine->firmware, "default"))) {
> +    if ((!firmware_filename) || (!strcmp(firmware_filename, "default"))) {
>          /*
>           * The user didn't specify -bios, or has specified "-bios default".
>           * That means we are going to load the OpenSBI binary included in
>           * the QEMU source.
>           */
> -        firmware_filename = riscv_find_firmware(default_machine_firmware);
> -    } else if (strcmp(machine->firmware, "none")) {
> -        firmware_filename = riscv_find_firmware(machine->firmware);
> +        filename = riscv_find_bios(default_machine_firmware);
> +    } else if (strcmp(firmware_filename, "none")) {
> +        filename = riscv_find_bios(firmware_filename);
>      }
>
> +    return filename;
> +}
> +
> +target_ulong riscv_find_and_load_firmware(MachineState *machine,
> +                                          const char *default_machine_firmware,
> +                                          hwaddr firmware_load_addr,
> +                                          symbol_fn_t sym_cb)
> +{
> +    char *firmware_filename;
> +    target_ulong firmware_end_addr = firmware_load_addr;
> +
> +    firmware_filename = riscv_find_firmware(machine->firmware,
> +                                            default_machine_firmware);
> +
>      if (firmware_filename) {
>          /* If not "none" load the firmware */
>          firmware_end_addr = riscv_load_firmware(firmware_filename,
> --
> 2.34.1
>
>

