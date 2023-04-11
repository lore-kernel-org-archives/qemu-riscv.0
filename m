Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4or-0001gP-U3
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4oq-0001fs-WB; Mon, 10 Apr 2023 23:37:21 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4op-0000Ma-H9; Mon, 10 Apr 2023 23:37:20 -0400
Received: by mail-vs1-xe33.google.com with SMTP id v1so6288551vsg.5;
 Mon, 10 Apr 2023 20:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681184238; x=1683776238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HuMQQjy2Lf1p2xulTsolw+c+cE+yaLL06bdCo2V+Y0=;
 b=mSTAlv01yBmWUATGFRIq7JaN8HVD+MwLVBUCxomJL1uX+OVjmRYOXmnTOabMwHjs24
 hyCF4XBcRyDelZHr3on1qfVM7FR8gfgVVuGCGin02/Nfnu7yeHuJ5tc6j32g4JfC4OBA
 +ynbftF9ffZfZ4gVNa6oJJBKQ6jRZGjbAn+G/lghtq1RuCZmWFRfDpfwC2DFjMMafl+n
 Z7gD1WsRuQJmGj5o2mcywbhDkaBehecxHdDcHAWVLoYlfUXEEF83gyjTRexZ6l+6EuHW
 pHjEPAOoiVC6KgKM5rVuUVFeRhWfwFn8Mv1k30j3p8djdT34w0SATaTfAIW78VNXCwC2
 d8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681184238; x=1683776238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HuMQQjy2Lf1p2xulTsolw+c+cE+yaLL06bdCo2V+Y0=;
 b=vFK3NgUmhD5J95XB8KgXZWbGP/kep2yPZrU56nV0/GUEct9Tm/LfRJLkjLpj6OFsWC
 33TUJXzyPZwtfb6xUpVj72WO44UclSXhIuxi68FCd0jbsuibvQrWSeEXYyv1zY03XKR2
 363tR9XlQurp1k4ftz6alPpNqXfL1vjr2bTaVM4DuOV8n9UaE21wZ9u9YBeYKeHriMPu
 dMgdob3Ml/ZJsM/fnprPDXZM4Y42hToIq9ghN+HC8j2p8kZ+hcqPqsvayCCJ78Ph0il7
 8+gDjJfW2wfCLrl9PSw6pNsTncVXtL2W2aZUHIYqdA2q0ukIVI1iVUZ7+WFIXA/NbYVW
 9t6g==
X-Gm-Message-State: AAQBX9cfGlY/FUJgRQZX2tEAG67qhCksUvWwpKxvIXuKxjfmHv3ONQ3Z
 RSWQOIHZTErwCBljD/kD4EZPvGnoZ9dhn+024u0=
X-Google-Smtp-Source: AKy350a4SjbmP2+tUMEAbGfGX7GmFq+RyXIiwiiuzTE2levzJ+BIHFLmi3jjEF1W5femnzZW1jYksF0RVzf4SFyyg00=
X-Received: by 2002:a67:ca06:0:b0:422:1654:7737 with SMTP id
 z6-20020a67ca06000000b0042216547737mr938099vsk.3.1681184237805; Mon, 10 Apr
 2023 20:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-12-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:36:51 +1000
Message-ID: <CAKmqyKP458eNvGF_t3Lge5PoDSZ4rOrGzN6WP+zbzM1CVAcy9Q@mail.gmail.com>
Subject: Re: [PATCH v6 11/25] target/riscv: Rename MMU_HYP_ACCESS_BIT to
 MMU_2STAGE_BIT
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:37:21 -0000

On Sat, Mar 25, 2023 at 9:57=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will enable more uses of this bit in the future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h  | 6 ++++--
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/op_helper.c  | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b55152a7dc..7b63c0f1b6 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -27,13 +27,15 @@
>   *  - S                 0b001
>   *  - S+SUM             0b010
>   *  - M                 0b011
> - *  - HLV/HLVX/HSV adds 0b100
> + *  - U+2STAGE          0b100
> + *  - S+2STAGE          0b101
> + *  - S+SUM+2STAGE      0b110
>   */
>  #define MMUIdx_U            0
>  #define MMUIdx_S            1
>  #define MMUIdx_S_SUM        2
>  #define MMUIdx_M            3
> -#define MMU_HYP_ACCESS_BIT  (1 << 2)
> +#define MMU_2STAGE_BIT      (1 << 2)
>
>  /* share data between vector helpers and decode code */
>  FIELD(VDATA, VM, 0, 1)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9bb84be4e1..888f7ae0ef 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -605,7 +605,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, b=
ool enable)
>
>  bool riscv_cpu_two_stage_lookup(int mmu_idx)
>  {
> -    return mmu_idx & MMU_HYP_ACCESS_BIT;
> +    return mmu_idx & MMU_2STAGE_BIT;
>  }
>
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 0f81645adf..81362537b6 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool=
 x, uintptr_t ra)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>      }
>
> -    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
> +    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
>  }
>
>  target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
> --
> 2.34.1
>
>

