Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0093C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 16:35:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNF4M-0004Ya-Cu; Tue, 09 Jan 2024 11:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rNF4K-0004Wf-LJ; Tue, 09 Jan 2024 11:35:12 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rNF4H-0001Rd-Ts; Tue, 09 Jan 2024 11:35:12 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 8FBB1C0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1704818102;
 bh=vdgkDOM5/u+LqaNthNvKcbajs5dJP1bw6KRrHrXNcws=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=OgWk+3zUulOIkuQ4NEy/ujFxVCKXrQCIRXOnS5yJpaOZ8EJvdJh2+hO/LRqAnl3cj
 jPiiFL+65Glt3ojEuDsuog4RJ1NxqqovvFx1/4wkotxZxqRQCRHVqOwbs14oL5jFu0
 686Z+pbQ2fU6ypjbNupZDWdOEnKeHG0OAPfIg5QvHP/Rv0Vjjwz6SZovvERjXh6aqt
 DQMbwcZLSHfSER6YyjJhzagvufDyiViz/6//jLE/K2n9dn6XByCpDsvKY00aII750v
 XrlO93Qhj68zMkYCwRsPs6kHUWKcF6hNVuRGIuijw0IBnMkqmbaUER4atIVSsEKiOo
 NlwNv9ImH5/aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1704818102;
 bh=vdgkDOM5/u+LqaNthNvKcbajs5dJP1bw6KRrHrXNcws=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=mr/VNQgWC43qrdrymATn4BmyyPWIt2uVAOOl7Xs96Wau3H0eQv4lbm25bqavH2Tim
 4CcxePBcGlBAEq/G1G3zsSLbt+4yNSsAjFe661Enti1VpoQnR65Ixax8FPnFVLHtjI
 8z5fHKu02tAN3efmKxkVUTPv4d1vDSDqhtW0XoM6Rbw1vdQ8lzFNRUvqynjOKzYS/U
 7W3Fk56wWWkjYHJ3a5TTWY3cWZAz7BqvtvBuM53uM5mMHBCGiRMc2FjH9tyfsszHUc
 BYCSvQ6CovbIgNNHoSfx7GbJmJNTZgjcngPL+uOgPmH08kp14nSokDh9AUC991/Y0a
 tcrIG1aPDiElQ==
Message-ID: <f6c563b9-eddc-4d52-b523-ffffa9d7afd5@syntacore.com>
Date: Tue, 9 Jan 2024 19:35:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] target/riscv: deprecate riscv_cpu_options[]
Content-Language: en-US, ru-RU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>, 
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <ajones@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Daniel,

06.01.2024 02:05, Daniel Henrique Barboza wrote:
> 
> Hi,
> 
> This new version contains changes due to a rebase with current
> riscv-to-apply.next, after "[PATCH v13 00/26] riscv: RVA22 profiles
> support" was queued.
> 
> Most notable change is a new patch (12) that was added to handle
> 'cbop_blocksize' - zicbop was added by the profile work that just got
> queued and was missing from v3.
> 
> A wrong 'cbom_blocksize' reference in patch 10 was also fixed.
> 
> Patches based on Alistair's riscv-to-apply.next.
> 
> Patches missing acks: 10, 12, 15, 16, 17
> 
> Changes from v3:
> - patch 10:
>   - changed wrong cbom_blocksize ref to cboz_blocksize
> - patch 12 (new):
>   - move cbop_blocksize to riscv_cpu_properties[]
> - v3 link: https://lore.kernel.org/qemu-riscv/20240103174013.147279-1-dbarboza@ventanamicro.com/
> 
>

This series work fine in my tests as well, thank you!  (sorry for the delay)

TCG part:

Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

> Daniel Henrique Barboza (17):
>   target/riscv/cpu_cfg.h: remove unused fields
>   target/riscv: make riscv_cpu_is_vendor() public
>   target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
>   target/riscv: move 'mmu' to riscv_cpu_properties[]
>   target/riscv: move 'pmp' to riscv_cpu_properties[]
>   target/riscv: rework 'priv_spec'
>   target/riscv: rework 'vext_spec'
>   target/riscv: move 'vlen' to riscv_cpu_properties[]
>   target/riscv: move 'elen' to riscv_cpu_properties[]
>   target/riscv: create finalize_features() for KVM
>   target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cbop_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
>   target/riscv: remove riscv_cpu_options[]
>   target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]
> 
>  target/riscv/cpu.c           | 755 ++++++++++++++++++++++++++++-------
>  target/riscv/cpu.h           |   8 +-
>  target/riscv/cpu_cfg.h       |   4 -
>  target/riscv/kvm/kvm-cpu.c   |  94 +++--
>  target/riscv/kvm/kvm_riscv.h |   1 +
>  target/riscv/tcg/tcg-cpu.c   |  63 ---
>  6 files changed, 676 insertions(+), 249 deletions(-)
> 
> --
> 2.43.0
> 
> 

