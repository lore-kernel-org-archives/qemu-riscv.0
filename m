Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pobDj-0001wy-NL
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobDh-0001wK-2u; Mon, 17 Apr 2023 22:37:25 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobDf-0000GF-LR; Mon, 17 Apr 2023 22:37:24 -0400
Received: by mail-ua1-x932.google.com with SMTP id r10so9960191uat.6;
 Mon, 17 Apr 2023 19:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681785442; x=1684377442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFCmbcFt/AuWzvlbiCEAlqSP30V0jEBRV51cRTrXZI8=;
 b=Kxpg8Mxt9hz7lD9PT0h1y+d6tN16jBjkIVk8vxJXNrbj4xq0n2+MBI/MysoXSI2URA
 trbgBheMaIoxKcSIiDiANWBabp8e8cS8fIUgXawUNd357L18KsRrrFoVxIr/+Sz3nfN1
 pIj6Tau8DiYoObBoWrITHZfWj91VfYC2p7He3eYM7zgzF7347XEZcxsMEwCpYPtwdMgb
 DtoXnZ3XYFLQl3w3JjZbW9UAlVJe9ofTWODveKUuzJDtXaHW/x3UDjDpqNA7mix964x6
 xycKhGX9dWBb+VrhbGwJNnIBIkelwV1fB/9Sz324bKroiuPHNyFqjyZcTiuH83kzqzp9
 e4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681785442; x=1684377442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFCmbcFt/AuWzvlbiCEAlqSP30V0jEBRV51cRTrXZI8=;
 b=NwVRtQ8YrCHyTLlghq2Qn/g4LnkvV1PJBUKBShh+ATd27taKoqJak+ZlyaExHgVqC0
 RYVrkofmNhBqfSwkWXKcQ002qLlEHYvBDx/SWaw4VjAmSU+X4KAbjvRbCb3tEp+X/Ro6
 XJhKrL4PnH26HyAbHEjLAfNrfl7BpOs+xNnCIymsLqelh4jCdDvmGKezC/Rdn/oyKCvO
 BGPgVtbi28s+b9Cmi6+/wG2B8NIliRnPToZWpBGgBnhbG4TM1Fr9B3hr547GGlHHfpPy
 8brEwZt5v7vZAJR/Rz+8koJqxaK3pe4L9EzqbMQNeFbc9jKN57Xqe+p0puENwbiLd3a7
 XO1g==
X-Gm-Message-State: AAQBX9dL13nw+hbyZwuipd0UOqkKP48RtdhM9HCNp4r9grwuJDuRchom
 4+mvbG2RCaYRZGHKVpHQ82elc2OQSl0tHZJlYLE=
X-Google-Smtp-Source: AKy350Y7GyTmZF4oT4943w2zJnrqV37+HWPNA3/ANUN7l8/eoph8HyyA6APFKZtJgW8wkWtdtxfzTkh4CzqVF4ttTTU=
X-Received: by 2002:a1f:c197:0:b0:440:4946:fa5 with SMTP id
 r145-20020a1fc197000000b0044049460fa5mr4223581vkf.0.1681785441991; Mon, 17
 Apr 2023 19:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230413090122.65228-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:36:55 +1000
Message-ID: <CAKmqyKPoxCsB0bTpi2SOxsaB9Ok+ik00UZ43CPRNdCUU5L8nuA@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/riscv: flush tlb when pmpaddr is updated
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Tue, 18 Apr 2023 02:37:25 -0000

On Thu, Apr 13, 2023 at 7:03=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> TLB should be flushed not only for pmpcfg csr changes, but also for
> pmpaddr csr changes.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 4f9389e73c..6d4813806b 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -537,6 +537,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
>          if (!pmp_is_locked(env, addr_index)) {
>              env->pmp_state.pmp[addr_index].addr_reg =3D val;
>              pmp_update_rule(env, addr_index);
> +            tlb_flush(env_cpu(env));
>          } else {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "ignoring pmpaddr write - locked\n");
> --
> 2.25.1
>
>

