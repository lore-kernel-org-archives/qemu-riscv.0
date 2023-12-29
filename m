Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD7C46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 11:34:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJB8L-00089b-1F; Fri, 29 Dec 2023 06:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJB8H-00089E-UD; Fri, 29 Dec 2023 06:34:29 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJB8B-0005SU-Sg; Fri, 29 Dec 2023 06:34:29 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 61609C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703849082;
 bh=5TGwGbn42LWBbG2bedrxELbNZhl1elT4+hXvCwGonMs=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=C0/wNmZZLzx/Gvw6PzMFfuSiyE00ZdJoze59jng7FwKGzeEUAyrEt+/nSFq74ESGL
 LQdgNHk4MV6r2LJHn/zO+WptAGfbLTdUGXrHuKJV49AAYHhj7ku6cWiGdRMTdldqvH
 jqBUzBpUQNiOn3qP+53Y06q3uSQ+C7twBkYwwqPSdnIXzmW2jAkSGzQMbPl22CxEwB
 L8GjFbbR2UlrcYaw6Vykw2lMSTBE24yUrnxFj2Yw5IGdllvzT+etcJ2gS0Vb6bvxDf
 0M0SPiuZn3bHckBsiVgN/1ZNhP4/JBA3AkTRxg/TQMvHEYwdS5oEC0PZ4L9A78oS+O
 tSDulvKExXVWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703849082;
 bh=5TGwGbn42LWBbG2bedrxELbNZhl1elT4+hXvCwGonMs=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=JESiKDQVqVWc8HmPT/alzTYYSBtc1kDDBfrvaBhxF8w+4gqAb1KbvhwmtIMTXmjml
 FKJrlCNZZH0h3qm+XHJhWU7eGcZSW2bBysuwwRzmkgUPdmSSushKMFJRpUnUS97zmd
 CO373ZgBP2WwzYuFHyE5UjYAV9YyO+7HXLMkPiJ4fNkpgU7uzWUNx3r4NHMGlbf7Hq
 MPF6JX7tKdS6lc9QjoZ4nipNOXRLG1pPF917A/PkRP/SXIUZEnbF4/iP1y6U4BjjTb
 DI9KLX4gqKqy68/6QonYFX2tFfE0qED+8r+VA7Vi5fRYyLS666jGyZLoyMhODNWc3Q
 S52o70JIdb1VQ==
Message-ID: <5dda647c-8a1b-4ccb-99f1-7c21e0ecaa61@syntacore.com>
Date: Fri, 29 Dec 2023 14:24:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] target/riscv: deprecate riscv_cpu_options[]
Content-Language: en-US, ru-RU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>, 
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <ajones@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
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

22.12.2023 15:22, Daniel Henrique Barboza wrote:
> 
> Hi,
> 
> This new version fixes all instances of 'const PropertyInfo' added,
> changing it to 'static const PropertyInfo', like suggested by Richard in
> v1.
> 
> Patches based on Alistair's riscv-to-apply.next. Series is also found
> here:
> 
> https://gitlab.com/danielhb/qemu/-/tree/fix_cpu_opts_v2
> 
> Changes from v1:
> - changed 'const PropertyInfo' to 'static const PropertyInfo' in all
>   relevant patches.
> - v1 link: https://lore.kernel.org/qemu-riscv/20231221175137.497379-1-dbarboza@ventanamicro.com/
> 
> Daniel Henrique Barboza (16):
>   target/riscv/cpu_cfg.h: remove user_spec and bext_spec
>   target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
>   target/riscv: make riscv_cpu_is_generic() public
>   target/riscv: move 'mmu' to riscv_cpu_properties[]
>   target/riscv: move 'pmp' to riscv_cpu_properties[]
>   target/riscv: rework 'priv_spec'
>   target/riscv: rework 'vext_spec'
>   target/riscv: move 'vlen' to riscv_cpu_properties[]
>   target/riscv: move 'elen' to riscv_cpu_properties[]
>   target/riscv: create finalize_features() for KVM
>   target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
>   target/riscv: remove riscv_cpu_options[]
>   target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]
> 
>  target/riscv/cpu.c           | 584 +++++++++++++++++++++++++++++------
>  target/riscv/cpu.h           |   7 +-
>  target/riscv/cpu_cfg.h       |   4 -
>  target/riscv/kvm/kvm-cpu.c   |  94 +++---
>  target/riscv/kvm/kvm_riscv.h |   1 +
>  target/riscv/tcg/tcg-cpu.c   |  63 ----
>  6 files changed, 561 insertions(+), 192 deletions(-)
> 
> --
> 2.43.0
> 
> 

For whole series and TCG part:

Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

