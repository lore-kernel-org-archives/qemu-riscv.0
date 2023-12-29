Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1253C46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 11:18:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJAs1-00049o-At; Fri, 29 Dec 2023 06:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAry-000490-8T; Fri, 29 Dec 2023 06:17:38 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAru-0007jC-16; Fri, 29 Dec 2023 06:17:38 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com AD159C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703848643;
 bh=QPvYOEhWKnZqvVheQ559ywQ5dymcLgmO1OfzcltYGr8=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=yDvT53RFCFIfN1AViLwU6aeSyaqI6/C2/qMpPpM7PGPzbrwswVhWELcFTMkmgK3i9
 5rZ4S2LexzanLPUl9F5RsMP115qCpl2dTguUnStRak0/5rrqKbrPT8Z8Djt8gdGzIf
 kkR8IqKmx1rwBqRQ+g0TPJGTEw6Lkp7l+L2Aaqq/Rm/HAc2dcIwy4q4mH624vacUJU
 cJRINbNA4ygX9zI7s6PyZQ7lrl2+cwTjGDd7O5nxZn54ByMEOy+2D1ouS+d9JVhGLH
 Gc6JhTRFOh4x+ro3sMeJ5dvagLmxjH3WwLItFu3D+qRGSF7xUbJrlna9nBNvwHuxTT
 tf5baVOEpNgOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703848643;
 bh=QPvYOEhWKnZqvVheQ559ywQ5dymcLgmO1OfzcltYGr8=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=Ld1Oh+3kxPrkzNRtc08kOAKGIeXTL0zxGuYtGbC3OoDVuyZPgHDHahW9YYQG229o4
 DZqS5f/RNNxBuJiQBP+Sbl55dfu3J1lRGiOUaDbWCbwogk5pqHOuel/bWpyNbhaVCj
 tJr2bffrykWmsdkDWKN7l1fXIlzKS08+Rq14ftVnR6RydNBQTsPaxbroSRuzlrkzet
 wFyYVJT4yjtHxKuJoc0sIshVYsFRytSuwwzqxk3Iy6kgS4oXlHTAwxh+q0aMFTseSg
 69MmQzlKGQmYXX7PeHDAue4m8t/RjpWIS1kkSq8BTVtUQ1wnx4tW1bLUwnLq9tMRFd
 OavetBsqKnk6Q==
Message-ID: <96ee211a-4a2e-40fa-a6f2-bb2ea692f2dd@syntacore.com>
Date: Fri, 29 Dec 2023 14:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: Re: [PATCH v2 01/16] target/riscv/cpu_cfg.h: remove user_spec and
 bext_spec
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>, 
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <ajones@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-2-dbarboza@ventanamicro.com>
Content-Language: en-US, ru-RU
In-Reply-To: <20231222122235.545235-2-dbarboza@ventanamicro.com>
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

22.12.2023 15:22, Daniel Henrique Barboza wrote:> 
> They aren't being used.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu_cfg.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..c67a8731d3 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -136,8 +136,6 @@ struct RISCVCPUConfig {
> 
>      uint32_t pmu_mask;
>      char *priv_spec;
> -    char *user_spec;
> -    char *bext_spec;
>      char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
> --
> 2.43.0
> 
> 

bext_ver from target/riscv/cpu.h is also unused.

