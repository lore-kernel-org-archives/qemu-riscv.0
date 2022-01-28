Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDGUT-0003Bo-JU
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jan 2022 20:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDGUN-00037W-GQ; Thu, 27 Jan 2022 20:55:47 -0500
Received: from [2607:f8b0:4864:20::12e] (port=38595
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDGUL-0005PA-TL; Thu, 27 Jan 2022 20:55:47 -0500
Received: by mail-il1-x12e.google.com with SMTP id i1so4168970ils.5;
 Thu, 27 Jan 2022 17:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hr6OQFuFWYgC1iKCFOFB0M/wM/oVSip5AG7YKrUtU98=;
 b=GfeYYET2ZibzcEcsZHLHX/SaDHQpLTnHF4NLagB8FKhxlsD7WQ3iRJ5wmtIDOQp1TH
 p54VoXJGhEFZgtnHWf8KgkyeyxPb6aRyPxnFelFx84c53UUlxXkZb9sbjIdNndAy6cD0
 JoenhFrWiQbAl3vDpgygpK+4wIxwU0BrySbm21Zf+b4GcL5GV2ErUUyMcRhg7fuG5PNo
 SiNEuSXHb4WAbUQkjba/+jtYFAXVCY2/Ji1kB3g4DRoiEDmeIWwKMmHmRXztCW9Iqc3Z
 iOxP+ctuJmKWIoi0Yp84ZDWeGEwjnkTl9BFkP2Y/xSOB/bkQUnIWTeNyoU5aXGw2d/Ju
 G37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hr6OQFuFWYgC1iKCFOFB0M/wM/oVSip5AG7YKrUtU98=;
 b=ViTlbj03fYwnynpbpuaTRcd89oKuka/KBSXAr8IulNDBKVeG0FrzbNtQDh44SEBXDn
 rX1jqkNLWOO0MI36jMTT+m7t8Y4qpGuu/j6FB4kd38QEujzcRYqIe7z9hDjDOjO5Mdtf
 t+7jt9dlPNeSpUuv+jEnJdF1uLu5zOSJkPDGpicu7DcHNm03uRSE2MgL6/n/veOwA4V2
 5hVeQdi3J7s/3iLcwH221l3CjR7ZNiFs0F0NRIOLRUskdFMhh2mDoIH08f2jxttRSA1Z
 AGJsy5Frer5gPw5crW3Qly7i36Z2ZJHmwb0heOGbCwoeWmmneaYUBtEcY6srW4HHxMz6
 /TIw==
X-Gm-Message-State: AOAM532KnRNDXQK5vmQo/a7XVlsaiVe17cj1D/IPM+aEhHe2nTL8qBY5
 FHtJtqC00etDt7I2sS1Sxefwq/9BAtW1zfl3swbXUWl9bn3wMgJL
X-Google-Smtp-Source: ABdhPJz8Efoy3U+UaZHQITN+ptT9O3KZ58jfN2qicx6HMg285VpOIym+BfiUS/iX88dSBA0Lv/RPAQ92zwlBDzussAM=
X-Received: by 2002:a05:6e02:1c4d:: with SMTP id
 d13mr4658153ilg.46.1643334944411; 
 Thu, 27 Jan 2022 17:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 11:55:18 +1000
Message-ID: <CAKmqyKODp62Qbu_fD2XPgjuDwP348eU6e-is6Ooh8b7d0Q2dLQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: correct "code should not be reached" for
 x-rv128
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Jan 2022 01:55:47 -0000

On Tue, Jan 25, 2022 at 6:35 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> The addition of uxl support in gdbstub adds a few checks on the maximum
> register length, but omitted MXL_RV128, an experimental feature.
> This patch makes rv128 react as rv64, as previously.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 3 +--
>  target/riscv/gdbstub.c | 3 +++
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..5ada71e5bf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -528,10 +528,9 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
>      switch (env->misa_mxl_max) {
>  #ifdef TARGET_RISCV64
>      case MXL_RV64:
> +    case MXL_RV128:
>          cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
>          break;
> -    case MXL_RV128:
> -        break;
>  #endif
>      case MXL_RV32:
>          cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index f531a74c2f..9ed049c29e 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *mem_buf, int n)
>      case MXL_RV32:
>          return gdb_get_reg32(mem_buf, tmp);
>      case MXL_RV64:
> +    case MXL_RV128:
>          return gdb_get_reg64(mem_buf, tmp);
>      default:
>          g_assert_not_reached();
> @@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          length =3D 4;
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          if (env->xl < MXL_RV64) {
>              tmp =3D (int32_t)ldq_p(mem_buf);
>          } else {
> @@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>                                   1, "riscv-32bit-virtual.xml", 0);
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
>                                   1, "riscv-64bit-virtual.xml", 0);
> --
> 2.34.1
>
>

