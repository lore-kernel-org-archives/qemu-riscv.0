Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntoBZ-0007Jn-BC
	for mharc-qemu-riscv@gnu.org; Wed, 25 May 2022 06:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ntoBX-0007Hr-RY
 for qemu-riscv@nongnu.org; Wed, 25 May 2022 06:24:11 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ntoBV-0007rR-IK
 for qemu-riscv@nongnu.org; Wed, 25 May 2022 06:24:11 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id i186so20868270vsc.9
 for <qemu-riscv@nongnu.org>; Wed, 25 May 2022 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QXXQbcDTFZDjBFZGG5S0M7v7oPYzaDUiHzQuT2a6a3Y=;
 b=N7LuyNWRuDM/ABLa045KggWutu1+j9+KB/dI/Lui1asK7wniVnp6IqMBCzzbNBNARm
 tm9emFy7uFbdtHFDjm4Ozq1wVvopxwSByOO9c5qtqIIiijsUut5oWS0cMAsQBpWYpfzl
 owz1QjhGczN57wkxlcauz0p5LCqsifLH6qV4FE+m5jSvuGvgLJpDkresQjammZH48z5C
 AVeRiVIcmpv7RF7U/YO6fiuuYNDX3YUK2SWpcIY272CftWNpnaAnrBRBdnZK2PdztDQq
 w9BRYDl8t2XTNhRt5Ups96OxSd/D7wiGcU29ACdiNhlH6OG5a5oXQiSj/Z6+c4WbDn+0
 z/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QXXQbcDTFZDjBFZGG5S0M7v7oPYzaDUiHzQuT2a6a3Y=;
 b=rixregFxveRnP6jIEpeAR36ebYbDl75xdssra1Rev5jGbbSQzz16LbXc0P9jWQsTDA
 /niXoYTtZlRj1l21goJwN5ozvisVm07XqJtoozmSj1U3TdSqwNkd4TCD7vnFeRpPDdc4
 nVqO9224UGQ1o3KjOpIl9Px3ZAPKqsZ9QNoTxVrGxVqJpNZCHaybKNvGRHeCvLD4MFr8
 JQkhbMA2/7x1b6tLyM/l+1/9+azt9V/3gOR57xaWUiUH76zENpq+92S3NyuM06wOa+fk
 9+IaoUPsJzjxHXWZjt/SHedVwUQr5X+ptcrTbzlkHeh43/V8QQt+KyG4Ct2nVj6GX+Da
 iGxQ==
X-Gm-Message-State: AOAM5335sUEMayimIO6oeuvQ4X7Cq4a2lgX9u1SYdTcOwbjcY84FjEA4
 sHNisKWGiNxY9yR+685on8IzCxpW40SFged1
X-Google-Smtp-Source: ABdhPJwNRNwbYfvJYNf6ZVWtnuHyOY1/r5Nbd0Bmygou/pOKOy74KqI5Nf0nIQvIgxH4XsQuwk49vg==
X-Received: by 2002:a67:f115:0:b0:335:c3b6:dd with SMTP id
 n21-20020a67f115000000b00335c3b600ddmr12318136vsk.67.1653474248530; 
 Wed, 25 May 2022 03:24:08 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 w5-20020ab06505000000b003626f894de3sm192942uam.17.2022.05.25.03.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 03:24:07 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id 67so5730778vsh.2;
 Wed, 25 May 2022 03:24:07 -0700 (PDT)
X-Received: by 2002:a05:6102:2044:b0:337:d8ed:84fe with SMTP id
 q4-20020a056102204400b00337d8ed84femr2554710vsr.30.1653474246964; Wed, 25 May
 2022 03:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220523235057.123882-1-atishp@rivosinc.com>
 <20220523235057.123882-10-atishp@rivosinc.com>
In-Reply-To: <20220523235057.123882-10-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 25 May 2022 18:23:56 +0800
X-Gmail-Original-Message-ID: <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
Message-ID: <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] target/riscv: Simplify counter predicate function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000022bb8105dfd37940"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=frank.chang@sifive.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Wed, 25 May 2022 10:24:12 -0000

--00000000000022bb8105dfd37940
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 8:02 AM Atish Patra <atishp@rivosinc.com> wrote:

> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 111 ++++-----------------------------------------
>  1 file changed, 10 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 723b52d836d3..e229f53c674d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    target_ulong ctr_mask;
>      int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>
> @@ -82,122 +83,30 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>          base_csrno += 0x80;
>      }
>      ctr_index = csrno - base_csrno;
> +    ctr_mask = BIT(ctr_index);
>
>      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>          goto skip_ext_pmu_check;
>      }
>
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>          /* No counter is enabled in PMU or the counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>  skip_ext_pmu_check:
>
> -    if (env->priv == PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
>

Should we also check PRV_U against env->scounteren here?

Regards,
Frank Chang


> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->mcounteren, ctr_mask)) {
> +            /* The bit must be set in mcountern for HS mode access */
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
>  #endif
> --
> 2.25.1
>
>
>

--00000000000022bb8105dfd37940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBNYXkgMjQsIDIwMjIgYXQgODow
MiBBTSBBdGlzaCBQYXRyYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmF0aXNocEByaXZvc2luYy5jb20i
PmF0aXNocEByaXZvc2luYy5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij5BbGwgdGhlIGhwbWNvdW50ZXJzIGFuZCB0aGUgZml4ZWQgY291
bnRlcnMgKENZLCBJUiwgVE0pIGNhbiBiZSByZXByZXNlbnRlZDxicj4NCmFzIGEgdW5pZmllZCBj
b3VudGVyLiBUaHVzLCB0aGUgcHJlZGljYXRlIGZ1bmN0aW9uIGRvZXNuJiMzOTt0IG5lZWQgaGFu
ZGxlIGVhY2g8YnI+DQpjYXNlIHNlcGFyYXRlbHkuPGJyPg0KPGJyPg0KU2ltcGxpZnkgdGhlIHBy
ZWRpY2F0ZSBmdW5jdGlvbiBzbyB0aGF0IHdlIGp1c3QgaGFuZGxlIHRoaW5ncyBkaWZmZXJlbnRs
eTxicj4NCmJldHdlZW4gUlYzMi9SVjY0IGFuZCBTL0hTIG1vZGUuPGJyPg0KPGJyPg0KUmV2aWV3
ZWQtYnk6IEJpbiBNZW5nICZsdDs8YSBocmVmPSJtYWlsdG86Ym1lbmcuY25AZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+Ym1lbmcuY25AZ21haWwuY29tPC9hPiZndDs8YnI+DQpBY2tlZC1ieTog
QWxpc3RhaXIgRnJhbmNpcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsaXN0YWlyLmZyYW5jaXNAd2Rj
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbTwvYT4mZ3Q7PGJy
Pg0KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgJmx0OzxhIGhyZWY9Im1haWx0bzphdGlzaHBA
cml2b3NpbmMuY29tIiB0YXJnZXQ9Il9ibGFuayI+YXRpc2hwQHJpdm9zaW5jLmNvbTwvYT4mZ3Q7
PGJyPg0KLS0tPGJyPg0KwqB0YXJnZXQvcmlzY3YvY3NyLmMgfCAxMTEgKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPg0KwqAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS90
YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQvcmlzY3YvY3NyLmM8YnI+DQppbmRleCA3MjNiNTJk
ODM2ZDMuLmUyMjlmNTNjNjc0ZCAxMDA2NDQ8YnI+DQotLS0gYS90YXJnZXQvcmlzY3YvY3NyLmM8
YnI+DQorKysgYi90YXJnZXQvcmlzY3YvY3NyLmM8YnI+DQpAQCAtNzQsNiArNzQsNyBAQCBzdGF0
aWMgUklTQ1ZFeGNlcHRpb24gY3RyKENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNzcm5vKTxicj4N
CsKgIMKgIMKgQ1BVU3RhdGUgKmNzID0gZW52X2NwdShlbnYpOzxicj4NCsKgIMKgIMKgUklTQ1ZD
UFUgKmNwdSA9IFJJU0NWX0NQVShjcyk7PGJyPg0KwqAgwqAgwqBpbnQgY3RyX2luZGV4Ozxicj4N
CivCoCDCoCB0YXJnZXRfdWxvbmcgY3RyX21hc2s7PGJyPg0KwqAgwqAgwqBpbnQgYmFzZV9jc3Ju
byA9IENTUl9DWUNMRTs8YnI+DQrCoCDCoCDCoGJvb2wgcnYzMiA9IHJpc2N2X2NwdV9teGwoZW52
KSA9PSBNWExfUlYzMiA/IHRydWUgOiBmYWxzZTs8YnI+DQo8YnI+DQpAQCAtODIsMTIyICs4Mywz
MCBAQCBzdGF0aWMgUklTQ1ZFeGNlcHRpb24gY3RyKENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNz
cm5vKTxicj4NCsKgIMKgIMKgIMKgIMKgYmFzZV9jc3JubyArPSAweDgwOzxicj4NCsKgIMKgIMKg
fTxicj4NCsKgIMKgIMKgY3RyX2luZGV4ID0gY3Nybm8gLSBiYXNlX2Nzcm5vOzxicj4NCivCoCDC
oCBjdHJfbWFzayA9IEJJVChjdHJfaW5kZXgpOzxicj4NCjxicj4NCsKgIMKgIMKgaWYgKChjc3Ju
byAmZ3Q7PSBDU1JfQ1lDTEUgJmFtcDsmYW1wOyBjc3JubyAmbHQ7PSBDU1JfSU5TVFJFVCkgfHw8
YnI+DQrCoCDCoCDCoCDCoCDCoChjc3JubyAmZ3Q7PSBDU1JfQ1lDTEVIICZhbXA7JmFtcDsgY3Ny
bm8gJmx0Oz0gQ1NSX0lOU1RSRVRIKSkgezxicj4NCsKgIMKgIMKgIMKgIMKgZ290byBza2lwX2V4
dF9wbXVfY2hlY2s7PGJyPg0KwqAgwqAgwqB9PGJyPg0KPGJyPg0KLcKgIMKgIGlmICgoIWNwdS0m
Z3Q7Y2ZnLnBtdV9udW0gfHwgIShjcHUtJmd0O3BtdV9hdmFpbF9jdHJzICZhbXA7IEJJVChjdHJf
aW5kZXgpKSkpIHs8YnI+DQorwqAgwqAgaWYgKCghY3B1LSZndDtjZmcucG11X251bSB8fCAhKGNw
dS0mZ3Q7cG11X2F2YWlsX2N0cnMgJmFtcDsgY3RyX21hc2spKSkgezxicj4NCsKgIMKgIMKgIMKg
IMKgLyogTm8gY291bnRlciBpcyBlbmFibGVkIGluIFBNVSBvciB0aGUgY291bnRlciBpcyBvdXQg
b2YgcmFuZ2UgKi88YnI+DQrCoCDCoCDCoCDCoCDCoHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxf
SU5TVDs8YnI+DQrCoCDCoCDCoH08YnI+DQo8YnI+DQrCoHNraXBfZXh0X3BtdV9jaGVjazo8YnI+
DQo8YnI+DQotwqAgwqAgaWYgKGVudi0mZ3Q7cHJpdiA9PSBQUlZfUykgezxicj4NCi3CoCDCoCDC
oCDCoCBzd2l0Y2ggKGNzcm5vKSB7PGJyPg0KLcKgIMKgIMKgIMKgIGNhc2UgQ1NSX0NZQ0xFOjxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVsZChlbnYtJmd0O21jb3VudGVyZW4s
IENPVU5URVJFTl9DWSkpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJ
U0NWX0VYQ1BfSUxMRUdBTF9JTlNUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCBjYXNlIENTUl9USU1FOjxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVsZChlbnYtJmd0O21jb3VudGVyZW4s
IENPVU5URVJFTl9UTSkpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJ
U0NWX0VYQ1BfSUxMRUdBTF9JTlNUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCBjYXNlIENTUl9JTlNUUkVU
Ojxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVsZChlbnYtJmd0O21jb3VudGVy
ZW4sIENPVU5URVJFTl9JUikpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJu
IFJJU0NWX0VYQ1BfSUxMRUdBTF9JTlNUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCBjYXNlIENTUl9IUE1D
T1VOVEVSMy4uLkNTUl9IUE1DT1VOVEVSMzE6PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIGlmICgh
Z2V0X2ZpZWxkKGVudi0mZ3Q7bWNvdW50ZXJlbiwgMSAmbHQ7Jmx0OyBjdHJfaW5kZXgpKSB7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxfSU5T
VDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBicmVh
azs8YnI+DQotwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCBpZiAocnYzMikgezxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCBzd2l0Y2ggKGNzcm5vKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIGNhc2UgQ1NSX0NZQ0xFSDo8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFn
ZXRfZmllbGQoZW52LSZndDttY291bnRlcmVuLCBDT1VOVEVSRU5fQ1kpKSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxfSU5TVDs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBicmVhazs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSBDU1JfVElNRUg6PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghZ2V0X2ZpZWxkKGVudi0mZ3Q7bWNvdW50ZXJl
biwgQ09VTlRFUkVOX1RNKSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBy
ZXR1cm4gUklTQ1ZfRVhDUF9JTExFR0FMX0lOU1Q7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIH08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIGNhc2UgQ1NSX0lOU1RSRVRIOjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpZiAoIWdldF9maWVsZChlbnYtJmd0O21jb3VudGVyZW4sIENPVU5URVJFTl9JUikpIHs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJU0NWX0VYQ1BfSUxMRUdB
TF9JTlNUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBjYXNlIENTUl9IUE1D
T1VOVEVSM0guLi5DU1JfSFBNQ09VTlRFUjMxSDo8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKCFnZXRfZmllbGQoZW52LSZndDttY291bnRlcmVuLCAxICZsdDsmbHQ7IGN0cl9pbmRl
eCkpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJU0NWX0VY
Q1BfSUxMRUdBTF9JTlNUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCB9PGJy
Pg0KLcKgIMKgIMKgIMKgIH08YnI+DQorwqAgwqAgaWYgKChlbnYtJmd0O3ByaXYgPT0gUFJWX1Mp
ICZhbXA7JmFtcDsgKCFnZXRfZmllbGQoZW52LSZndDttY291bnRlcmVuLCBjdHJfbWFzaykpKSB7
PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlNob3VsZCB3ZSBhbHNvIGNoZWNr
IFBSVl9VIGFnYWluc3QgZW52LSZndDtzY291bnRlcmVuIGhlcmU/PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5SZWdhcmRzLDwvZGl2PjxkaXY+RnJhbmsgQ2hhbmc8L2Rpdj48ZGl2PsKgPC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPg0KK8KgIMKgIMKgIMKgIHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxfSU5TVDs8YnI+
DQrCoCDCoCDCoH08YnI+DQo8YnI+DQrCoCDCoCDCoGlmIChyaXNjdl9jcHVfdmlydF9lbmFibGVk
KGVudikpIHs8YnI+DQotwqAgwqAgwqAgwqAgc3dpdGNoIChjc3Jubykgezxicj4NCi3CoCDCoCDC
oCDCoCBjYXNlIENTUl9DWUNMRTo8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFnZXRfZmll
bGQoZW52LSZndDtoY291bnRlcmVuLCBDT1VOVEVSRU5fQ1kpICZhbXA7JmFtcDs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X2ZpZWxkKGVudi0mZ3Q7bWNvdW50ZXJlbiwgQ09VTlRF
UkVOX0NZKSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gUklTQ1ZfRVhD
UF9WSVJUX0lOU1RSVUNUSU9OX0ZBVUxUOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCi3CoCDCoCDCoCDCoCBjYXNlIENTUl9USU1F
Ojxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVsZChlbnYtJmd0O2hjb3VudGVy
ZW4sIENPVU5URVJFTl9UTSkgJmFtcDsmYW1wOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBnZXRfZmllbGQoZW52LSZndDttY291bnRlcmVuLCBDT1VOVEVSRU5fVE0pKSB7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBSSVNDVl9FWENQX1ZJUlRfSU5TVFJVQ1RJT05f
RkFVTFQ7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
YnJlYWs7PGJyPg0KLcKgIMKgIMKgIMKgIGNhc2UgQ1NSX0lOU1RSRVQ6PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIGlmICghZ2V0X2ZpZWxkKGVudi0mZ3Q7aGNvdW50ZXJlbiwgQ09VTlRFUkVOX0lS
KSAmYW1wOyZhbXA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF9maWVsZChlbnYt
Jmd0O21jb3VudGVyZW4sIENPVU5URVJFTl9JUikpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVDVElPTl9GQVVMVDs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQotwqAg
wqAgwqAgwqAgY2FzZSBDU1JfSFBNQ09VTlRFUjMuLi5DU1JfSFBNQ09VTlRFUjMxOjxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVsZChlbnYtJmd0O2hjb3VudGVyZW4sIDEgJmx0
OyZsdDsgY3RyX2luZGV4KSAmYW1wOyZhbXA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ2V0X2ZpZWxkKGVudi0mZ3Q7bWNvdW50ZXJlbiwgMSAmbHQ7Jmx0OyBjdHJfaW5kZXgpKSB7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBSSVNDVl9FWENQX1ZJUlRfSU5T
VFJVQ1RJT05fRkFVTFQ7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgYnJlYWs7PGJyPg0KLcKgIMKgIMKgIMKgIH08YnI+DQotwqAgwqAgwqAgwqAgaWYg
KHJ2MzIpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgc3dpdGNoIChjc3Jubykgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCBjYXNlIENTUl9DWUNMRUg6PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmICghZ2V0X2ZpZWxkKGVudi0mZ3Q7aGNvdW50ZXJlbiwgQ09VTlRFUkVOX0NZKSAm
YW1wOyZhbXA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF9maWVsZChl
bnYtJmd0O21jb3VudGVyZW4sIENPVU5URVJFTl9DWSkpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVDVElPTl9GQVVMVDs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBicmVhazs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgY2FzZSBDU1JfVElNRUg6PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghZ2V0X2ZpZWxkKGVudi0mZ3Q7aGNvdW50ZXJl
biwgQ09VTlRFUkVOX1RNKSAmYW1wOyZhbXA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGdldF9maWVsZChlbnYtJmd0O21jb3VudGVyZW4sIENPVU5URVJFTl9UTSkpIHs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9J
TlNUUlVDVElPTl9GQVVMVDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgY2Fz
ZSBDU1JfSU5TVFJFVEg6PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghZ2V0X2Zp
ZWxkKGVudi0mZ3Q7aGNvdW50ZXJlbiwgQ09VTlRFUkVOX0lSKSAmYW1wOyZhbXA7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF9maWVsZChlbnYtJmd0O21jb3VudGVyZW4s
IENPVU5URVJFTl9JUikpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0
dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVDVElPTl9GQVVMVDs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgY2FzZSBDU1JfSFBNQ09VTlRFUjNILi4uQ1NSX0hQTUNPVU5URVIz
MUg6PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghZ2V0X2ZpZWxkKGVudi0mZ3Q7
aGNvdW50ZXJlbiwgMSAmbHQ7Jmx0OyBjdHJfaW5kZXgpICZhbXA7JmFtcDs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnZXRfZmllbGQoZW52LSZndDttY291bnRlcmVuLCAx
ICZsdDsmbHQ7IGN0cl9pbmRleCkpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVDVElPTl9GQVVMVDs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCivCoCDCoCDCoCDCoCBpZiAoIWdldF9maWVs
ZChlbnYtJmd0O21jb3VudGVyZW4sIGN0cl9tYXNrKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCAvKiBUaGUgYml0IG11c3QgYmUgc2V0IGluIG1jb3VudGVybiBmb3IgSFMgbW9kZSBhY2Nlc3Mg
Ki88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVD
VElPTl9GQVVMVDs8YnI+DQorwqAgwqAgwqAgwqAgfSBlbHNlIGlmICghZ2V0X2ZpZWxkKGVudi0m
Z3Q7aGNvdW50ZXJlbiwgY3RyX21hc2spKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIHJldHVy
biBSSVNDVl9FWENQX1ZJUlRfSU5TVFJVQ1RJT05fRkFVTFQ7PGJyPg0KwqAgwqAgwqAgwqAgwqB9
PGJyPg0KwqAgwqAgwqB9PGJyPg0KwqAjZW5kaWY8YnI+DQotLSA8YnI+DQoyLjI1LjE8YnI+DQo8
YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+DQo=
--00000000000022bb8105dfd37940--

