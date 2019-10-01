Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFMyL-0008KV-WE
	for mharc-qemu-riscv@gnu.org; Tue, 01 Oct 2019 14:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iFMyJ-0008Jt-FD
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iFMyI-0002hb-3b
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:03 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iFMyH-0002h6-SU
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:02 -0400
Received: by mail-pg1-x541.google.com with SMTP id c17so10277232pgg.4
 for <qemu-riscv@nongnu.org>; Tue, 01 Oct 2019 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=S6a5oA3Zj6JrzqQjT6/wQI3o70xoT4MbmOz5qrTzy84=;
 b=EJonZtdKHP3xCRc9u71MMH/41QaBX1QO0p6JxCyjkcGgYS9Lc97bcQIkYfeipkSPe1
 e2UEiOU7xgsGGX+jqK4vwn4Gc2V66JOcK3kKl+SgipTHr7dnpjh2+nwoVF12MKb8YF5M
 z6kEC6bBx+YUfMiSkqmPc1yN50BaIqcISUIgMLgjKei+75JoIhd2CD69YIEFwNYM0CRs
 BIVPzkUQTVdMBtwfL5qdshkzLTLCF9gRfSN2cF1xuMEMfQgoB6NuHy4a8MJhxz8Q6l/6
 v8FMrlbcXcj7VCD6FY2pMQv5gpoyw4Sik0lOw7waneiqZHcQHFpiQ//MbqdwkydXoECH
 cjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=S6a5oA3Zj6JrzqQjT6/wQI3o70xoT4MbmOz5qrTzy84=;
 b=DWxfyCMru8pwB+ttVd+OsPkrWM6SctL6RF9fCGTUaJn1MyZCTPBsXlQev5XrelLdX+
 vosV/JDr1Q1j9jJi+7FfwD3AIA+HFUItmOY3o/byxZshF2FSu29LI3LqzsULu9/ZUacU
 wxjL9eLxmlxfdt7/h+s7oRnt+GN6HMv9+acfHNgscgSa2uD2Kfxgpe6aQ1MMBZfPGtEm
 qx6B2lNd2T3sotbjZ8Y2k+9j3KcFHUjy6ziOtMqHGJdKpKc6PhVCTYnayyBp+mgACNfJ
 PrvbNqDrQSE80N9Xlyfhk00y7YYDOPd8qM/vVmYaF6l6t3dPlBXPwEE/Jf2ilil8e1gW
 l4Lg==
X-Gm-Message-State: APjAAAX5uaqpgX6SKNvoPaG84aK3WUXI8CNbaPj4k2bjBvDJBkNXbNDc
 F4n/807GzhEBlC+QM+5ZvO7MfA==
X-Google-Smtp-Source: APXvYqwCHOF1mdeKfYaRJ25LqX8lifdSE5T1sA9JBgRGxl9uvtzQvLUedip/7XlfwSfVZhcPmJ7eAQ==
X-Received: by 2002:a62:e106:: with SMTP id q6mr28730857pfh.14.1569954840139; 
 Tue, 01 Oct 2019 11:34:00 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c3sm3551608pgl.51.2019.10.01.11.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 11:33:59 -0700 (PDT)
Date: Tue, 01 Oct 2019 11:33:59 -0700 (PDT)
X-Google-Original-Date: Tue, 01 Oct 2019 11:27:13 PDT (-0700)
Subject: Re: [PATCH v1 17/28] target/riscv: Add Hypervisor trap return support
In-Reply-To: <6e2920dbef1ed86b8784827200525c5a112468b2.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-5f63f9ba-daec-4cae-a1f8-23f2a59a244b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 18:34:04 -0000

On Fri, 23 Aug 2019 16:38:34 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/op_helper.c | 66 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 54 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index beb34e705b..5bcf5d2ff7 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -73,6 +73,8 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
>
>  target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>  {
> +    target_ulong prev_priv, prev_virt, mstatus;
> +
>      if (!(env->priv >= PRV_S)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
> @@ -87,16 +89,46 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> -    target_ulong mstatus = *env->mstatus;
> -    target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
> -    mstatus = set_field(mstatus,
> -        env->priv_ver >= PRIV_VERSION_1_10_0 ?
> -        MSTATUS_SIE : MSTATUS_UIE << prev_priv,
> -        get_field(mstatus, MSTATUS_SPIE));
> -    mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
> -    mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> +    mstatus = *env->mstatus;
> +
> +    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
> +        /* We support Hypervisor extensions and virtulisation is disabled */
> +        target_ulong hstatus = env->hstatus;
> +
> +        prev_priv = get_field(mstatus, MSTATUS_SPP);
> +        prev_virt = get_field(hstatus, HSTATUS_SPV);
> +
> +        hstatus = set_field(hstatus, HSTATUS_SPV,
> +                                 get_field(hstatus, HSTATUS_SP2V));
> +        mstatus = set_field(mstatus, MSTATUS_SPP,
> +                            get_field(hstatus, HSTATUS_SP2P));
> +        hstatus = set_field(hstatus, HSTATUS_SP2V, 0);
> +        hstatus = set_field(hstatus, HSTATUS_SP2P, 0);
> +        mstatus = set_field(mstatus, SSTATUS_SIE,
> +                            get_field(mstatus, SSTATUS_SPIE));
> +        mstatus = set_field(mstatus, SSTATUS_SPIE, 1);
> +
> +        *env->mstatus = mstatus;
> +        env->hstatus = hstatus;
> +
> +        if (prev_virt == VIRT_ON) {
> +            riscv_cpu_swap_hypervisor_regs(env);
> +        }
> +
> +        riscv_cpu_set_virt_enabled(env, prev_virt);
> +    } else {
> +        prev_priv = get_field(mstatus, MSTATUS_SPP);
> +
> +        mstatus = set_field(mstatus,
> +            env->priv_ver >= PRIV_VERSION_1_10_0 ?
> +            MSTATUS_SIE : MSTATUS_UIE << prev_priv,
> +            get_field(mstatus, MSTATUS_SPIE));
> +        mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
> +        mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> +        *env->mstatus = mstatus;
> +    }
> +
>      riscv_cpu_set_mode(env, prev_priv);
> -    *env->mstatus = mstatus;
>
>      return retpc;
>  }
> @@ -114,14 +146,24 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>
>      target_ulong mstatus = *env->mstatus;
>      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
> +    target_ulong prev_virt = get_field(mstatus, MSTATUS_MPV);
>      mstatus = set_field(mstatus,
>          env->priv_ver >= PRIV_VERSION_1_10_0 ?
>          MSTATUS_MIE : MSTATUS_UIE << prev_priv,
>          get_field(mstatus, MSTATUS_MPIE));
> -    mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
> -    mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
> -    riscv_cpu_set_mode(env, prev_priv);
> +    mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
> +    mstatus = set_field(mstatus, MSTATUS_MPP, 0);
> +    mstatus = set_field(mstatus, MSTATUS_MPV, 0);
>      *env->mstatus = mstatus;
> +    riscv_cpu_set_mode(env, prev_priv);
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        if (prev_virt == VIRT_ON) {
> +            riscv_cpu_swap_hypervisor_regs(env);
> +        }
> +
> +        riscv_cpu_set_virt_enabled(env, prev_virt);
> +    }
>
>      return retpc;
>  }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

