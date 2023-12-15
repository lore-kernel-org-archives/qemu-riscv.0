Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B84C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:38:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE4ef-0001iZ-Uv; Fri, 15 Dec 2023 04:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE4ee-0001iK-RD; Fri, 15 Dec 2023 04:38:48 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE4ed-0007P7-AM; Fri, 15 Dec 2023 04:38:48 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4b2e50b58ffso85123e0c.1; 
 Fri, 15 Dec 2023 01:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702633126; x=1703237926; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0U69EDvWAbRnIbjcd+5ZBed/+wku7UKI/oUsNQpOoM=;
 b=lQdTrpHp9m7IxUoK3nAkEt78aOqYI7/R4wZQFL0FE9EHOlidaFyCZeHf3M873ibhYG
 1DKDSLoooWuIGSHcS20xzJkRZ1m/CPmHExI2u1gZLNx9iFaLxDkZoSajROzhv6O7+GN+
 yMpdCAX7c3HBl2gNRL1r7I8DRgc5fPc0JlIF9mcnrU97c56/H3vW8s03PgGuMrwcgFHe
 xPyRZGgMnf+Bx+r7kzVdOVhEcWddayZEcBvRlwAHB5LkjVEjImGpgymssUyym9HxQcJh
 InDx6qLHDWYMtLee2AVJ011sgQ/xjRKn5GFltoW2DFTXgOTO+hcGjaFL63jXv38ZkvaI
 myLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702633126; x=1703237926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0U69EDvWAbRnIbjcd+5ZBed/+wku7UKI/oUsNQpOoM=;
 b=WQ4QIR2++ytVi3wA77jqSiBy3N22F8a2pI12ex2r7xe/fwuZ96S0Zj/1yTouxhUzuK
 p/3V+OX8Z6lFzY7w0T4v0YwfgPMUYwjlDV52KOayexFArUSM16aGqM6rilkedJXrRg5B
 2ZXwhezlqhyHdH/HylMAVYABFpxI8WAmX6/+4+eiLBhvEckwhle867LUFJlmBKxfsIid
 RDXsxaAYNRu3SKa2QKGVmyskb4KaFKx4vOm2YbltiqJizYEDAQBStnUUpb+eC1RjdNND
 Adrk8OjeYmNZT3RbFfFPxg0uQVesUnPc7Mk3ttlMHuM7B+mUMxdvgef3FxQxJoeSXITL
 A2Wg==
X-Gm-Message-State: AOJu0YwXlqw+tHc3Eumcwlj1kzVtP5zVf6+3aT5mLArZuWzQXpwbI8b0
 r/OJK6z0aJvMdNFIfG665IxjK6i234TbbJtRtLc=
X-Google-Smtp-Source: AGHT+IGjjWRULsSlJGvf/PO4kEKGc+JmrNiCuSpFPa4xUWi+QoQVa6nEgJnyhK28zratnVzx4VSKw+NCpuvX8YypNHY=
X-Received: by 2002:a05:6122:4c1a:b0:4b2:f60d:fc5 with SMTP id
 ff26-20020a0561224c1a00b004b2f60d0fc5mr4291327vkb.28.1702633125833; Fri, 15
 Dec 2023 01:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20231208094315.177-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231208094315.177-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 19:38:19 +1000
Message-ID: <CAKmqyKN_SscF=qQETXhfAwEWO-+3upF8nOfX4_VXuy0myB1AtQ@mail.gmail.com>
Subject: Re: [PATCH for 8.2] target/riscv: Fix th.dcache.cval1 priviledge check
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 christoph.muellner@vrull.eu, alistair.francis@wdc.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Dec 8, 2023 at 7:45=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
> According to the specification, the th.dcache.cvall1 can be executed
> under all priviledges.
> The specification about xtheadcmo located in,
> https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadcmo=
/dcache_cval1.adoc
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 810d76665a..dbb6411239 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -296,7 +296,7 @@ NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUI=
RE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> -NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
>
>  NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>  NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> --
> 2.17.1
>
>

