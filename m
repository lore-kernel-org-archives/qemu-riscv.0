Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4Rk-0005qX-1j
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4Ri-0005qJ-1Y; Mon, 10 Apr 2023 23:13:26 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm4Rf-0003xj-Vl; Mon, 10 Apr 2023 23:13:25 -0400
Received: by mail-ua1-x92f.google.com with SMTP id t20so17666726uaw.5;
 Mon, 10 Apr 2023 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681182802; x=1683774802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myz5dNZQJJG1+wLx9V3gupb/LdK72RP2gQz6YhhLTng=;
 b=SgzAhBPnzUeM2ZRNTojRgjP044y+vqA3XHshlcD85Njcq6im2TGH8h4Muq939ruLrw
 PCsBVsDpvw2CqIm9kJ2Ng4DJzWuSRGhKSaxylWtVg2kIXaM4dF8v9tky+QU4hJWeWktY
 tBekD8CueLmqHSwddEMyPgbkDfS4xYHkEiwab/e2z6+v15d0OVHkiBJXVuNRttaNsdoh
 waL9hFTlgksSyg8xUUWe7wSd874UhdFEL7yuZozyQhX1eDoL8nhyfSdmhjaRr5M3QwKB
 vyC4NBRMwtOu1gG4vo5bhUZOXbzQKFA4HWb1fEaFXYyDh2rIDRDKB9xUzOyrPzrmgh1k
 fhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681182802; x=1683774802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myz5dNZQJJG1+wLx9V3gupb/LdK72RP2gQz6YhhLTng=;
 b=p/e1QCDkirQU+XF2GDVBxwl6ovRZMgBtYChsefGbii/QKyEDBvgUKtmCtu0+Uk6X+v
 g8RE2uT5f6vL23goi3+xBKhYjowuZCj4h35PAQFBs9dg4oKIZ97x41TvRwx+xAko9fuh
 ebhUIlNzVrZ7HiN5QHTLjlAXnuy1GMzbDxVHRRzQaUxH42wUrqs0gmbgX/so+ayyXtTF
 suCDuQ+BQHtvz9U5W95OngoclEYPBFjlmW8J18sFVrO98XlK/bMJS/POuftLXpJJo2l6
 jDgs5ZwSQTRlAM/+L/XjKBdItNPQzDeGxhG5vWbxFMHll59qOmfBHS87OdaOGrsZlMez
 uD1w==
X-Gm-Message-State: AAQBX9edlW7oa83NnRBKQaRn3ayd293ZBf7dePGI95wb/Wrl8DFWt7lg
 /0zy9AHcxirWGWfPwwoF4PhjVgHH5ZamMtK7Osk=
X-Google-Smtp-Source: AKy350YT2kLCv5DWEyJG1wk9usybDO4UtdYSyI8oAu81u7Q6O8AkrnZPS5zQSpPs5MV4yO+kUfqc5VrEdKDmYDo06A8=
X-Received: by 2002:a1f:3041:0:b0:43f:c4ba:48ec with SMTP id
 w62-20020a1f3041000000b0043fc4ba48ecmr4262164vkw.0.1681182802641; Mon, 10 Apr
 2023 20:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-10-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:12:56 +1000
Message-ID: <CAKmqyKMt30jvTRWnmWFtFUrmJU797FbL_8Yqv5reC6RMdknfaw@mail.gmail.com>
Subject: Re: [PATCH v6 09/25] target/riscv: Use cpu_ld*_code_mmu for HLVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 11 Apr 2023 03:13:26 -0000

On Sat, Mar 25, 2023 at 9:53=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions to properly check execute permission
> for the read rather than read permission.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 962a061228..b2169a99ff 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -427,18 +427,27 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>      helper_hyp_tlb_flush(env);
>  }
>
> +/*
> + * TODO: These implementations are not quite correct.  They perform the
> + * access using execute permission just fine, but the final PMP check
> + * is supposed to have read permission as well.  Without replicating
> + * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
> + * which would imply that exact check in tlb_fill.
> + */
>  target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address=
)
>  {
>      int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUW, mmu_idx);
>
> -    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
> +    return cpu_ldw_code_mmu(env, address, oi, GETPC());
>  }
>
>  target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address=
)
>  {
>      int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
> +    MemOpIdx oi =3D make_memop_idx(MO_TEUL, mmu_idx);
>
> -    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
> +    return cpu_ldl_code_mmu(env, address, oi, GETPC());
>  }
>
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.34.1
>
>

