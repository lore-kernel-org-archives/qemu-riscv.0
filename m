Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6n7-0008Kp-TW
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 19:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6mI-0007up-0f; Mon, 23 Jan 2023 19:03:06 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6m9-00028v-1L; Mon, 23 Jan 2023 19:02:59 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id q21so6847222vka.3;
 Mon, 23 Jan 2023 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c1YJgx8oouI1+iigt5uBmKTEODVpdnOoa3xvMI40h2A=;
 b=SQ/4+0bDSU1jM2Lt+JpdEAYbAaeyt0KYMCXnrRtmwdIhzHS8Xvf43OTVzy/I46bdh6
 Q5Zh6YH3w30skpEdEpjW8Ch45x7/SDRQZ/kG97O/qMQGWJXUtuLe9G0ADvR1DEdSlTWw
 AN5qe+GQ52CCxOMgnuMLJ4a9gp4H9YU53diwSultjQPLMTh5g+wnXwNO+lc8OvSJhtui
 EsjTC45PJmro+BZHhuZlK5pxyxPUA28UdKrlmpQ28o9I3hMR4KRCVbR1KnXK8Cyu8eNf
 72JtrQoTWWJeSBZo2iwZjf7t4cYzmK3Gkf8khmn4z+v9FNo94C8/CV5hChlEX1fRTIKC
 7cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c1YJgx8oouI1+iigt5uBmKTEODVpdnOoa3xvMI40h2A=;
 b=F9zbmIjUq0yKultkuvHd60tXfIfb3/i68LPs8hHDOUqCulonAQ4t4Tk8soh7qKmf7s
 EbY0hqAKSv4qnoiZY43n859Aovl83LUM4s5b/tsYDStD88uxHad2zjOp96CUZTBI4ejT
 d+xgk2giay8cCkC07cl3cQjCTS5yGe8xEDqgwn7tf+5eg2gs9gSrEqHVRMiPRNUMxpcN
 5iRAdJ55LeJ2958cu38Wy5TfUlO76h4R27WRX/5bH5vM/k86r4si+/AbYK2ittqoZ08h
 dw4TPYX0Du8yOvw4j6lLzbGMFVdKfwIbQWS2/VQ1ZAzl8vSjFHDikK3oHeP/dx9YrFDW
 F/kQ==
X-Gm-Message-State: AFqh2kpXi10VhgYUR/su54ikgBawg2X3t/ggRpJcUc+KPi6s3JnDlVtB
 g2RqirONJfsenejk71ZvV/DRSXs+Loc9gVrX9qg=
X-Google-Smtp-Source: AMrXdXvcWfcxdItUpAyzuAXfD3Z2Y8eTk1qIAkNMFzl27MQPiBoJ1e9fmqpsw2EpqTi6x8Sv0Hg4jF8MqbCgl58QH4g=
X-Received: by 2002:a05:6122:924:b0:3d5:5f93:53f with SMTP id
 j36-20020a056122092400b003d55f93053fmr3417542vka.7.1674518575481; Mon, 23 Jan
 2023 16:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-3-alexghiti@rivosinc.com>
In-Reply-To: <20230123090324.732681-3-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 10:02:29 +1000
Message-ID: <CAKmqyKN-w7tXj7kenvsTir3tn2-96Vtb6gFYECcBbWddxhgd+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 00:03:55 -0000

On Mon, Jan 23, 2023 at 7:06 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> This array is actually used as a boolean so swap its current char type
> to a boolean and at the same time, change the type of validate_vm to
> bool since it returns valid_vm_1_10_[32|64].
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0db2c233e5..6b157806a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>
> -static const char valid_vm_1_10_32[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV32] = 1
> +static const bool valid_vm_1_10_32[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV32] = true
>  };
>
> -static const char valid_vm_1_10_64[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV39] = 1,
> -    [VM_1_10_SV48] = 1,
> -    [VM_1_10_SV57] = 1
> +static const bool valid_vm_1_10_64[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV39] = true,
> +    [VM_1_10_SV48] = true,
> +    [VM_1_10_SV57] = true
>  };
>
>  /* Machine Information Registers */
> @@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static int validate_vm(CPURISCVState *env, target_ulong vm)
> +static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          return valid_vm_1_10_32[vm & 0xf];
> @@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    target_ulong vm, mask;
> +    target_ulong mask;
> +    bool vm;
>
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;
> --
> 2.37.2
>
>

