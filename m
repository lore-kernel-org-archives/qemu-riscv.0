Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CAC606A31E
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nongnu.org header.i=@nongnu.org header.a=rsa-sha256 header.s=lists1p-gnu-org header.b=pIokrWJW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rev.ng header.i=@rev.ng header.a=rsa-sha256 header.s=dkim header.b=uRCX/DNp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nongnu.org;
	 s=lists1p-gnu-org; h=From:In-Reply-To:MIME-Version:References:Subject:To:
	Date; bh=sO6n3Nz7CcWVc9f4NK7k91R0s+6HIrxUvbY6EJEC2qE=; b=pIokrWJWu4bMa9kRC6/7
	MboQl+qS6NVCB5eSAJ2e7VqgK3bbngUTyRMb/jYsaFFFitmdbYXYmQ+SthIr27kekH9kLpzQQz+aO
	pauegb9nvwpX0DA5GsTDhjYv5e47tszx/FYdNpHPvsnPtA5bEBUFKgRodW6k6j95bXwMVcKSg7f8b
	CfCizp/pM0i/fcpkZImUB4ITeL2FoEvqKSZyEXe7hJnavsMUzmX0s7PKfuehXa3UvKzPlyc+tqYmC
	wngVTnyb4rlypabOGzNWY/3E9ovksZq+gWmkXY56C6lyGATg6Gowm2pA197KPKZaGHiIfvpvyr5Me
	6+4L/HqSOiPSpw==;
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWtzx-0000wj-4f; Fri, 27 Nov 2026 06:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtzt-0000w3-Uq; Fri, 27 Nov 2026 06:20:09 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtzs-0000qb-Ih; Fri, 27 Nov 2026 06:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=sO6n3Nz7CcWVc9f4NK7k91R0s+6HIrxUvbY6EJEC2qE=; b=uRCX/DNpts5YCk2
 DAHtV1XT0AQreySGz9slWnZ5L2lJoUyrBAP6ByMIHHvZz5OMRyCHDGduEuMqZn9Aauj7rLw6YD34B
 r/EZ9Gr7DtcDl0NRI5FuHW2J5oMt52PpL4k8TorUujhBMqyDHTBCb4g+CD6kgIa86uYJu3Sf/ifnb
 D0=;
Date: Fri, 27 Nov 2026 12:26:30 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Subject: Re: [PATCH 17/24] target/riscv: Partially revert use of tb->cs_base
Message-ID: <awloQzdpAODHw42g@hive.localdomain>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-18-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126233604.67722-18-philmd@oss.qualcomm.com>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-riscv@nongnu.org>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/26, Philippe Mathieu-Daudé wrote:
> Partially revert commit 1c88ab9e77bd ("target/riscv: Use the
> tb->cs_base as the extend tb flags"): now that TranslationBlock::flags
> is 64-bit, keep only misa_ext in tb->cs_base (as in 55b490b58fbf) and
> move the other extended flags (ALTFMT, BIG_ENDIAN, SDEXT_STEP) into
> TB_FLAGS at bits 32+.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  include/exec/translation-block.h |  2 +-
>  target/riscv/cpu.h               |  8 +++-----
>  target/riscv/tcg/tcg-cpu.c       | 12 +++++-------
>  target/riscv/tcg/translate.c     |  7 +++----
>  4 files changed, 12 insertions(+), 17 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>

