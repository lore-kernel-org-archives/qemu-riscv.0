Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B11EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 00:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHD4E-0002m9-4V; Wed, 05 Jul 2023 20:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 1qHCGW-0000cn-9A
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 19:50:32 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 1qHCGU-0001ra-7O
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 19:50:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC27361824;
 Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC4A4C433C9;
 Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688601022;
 bh=BgODPXLPTsaU0wj68dFe2wWU/mnAmoYudmtTIg9uug4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aq+2KA2q3s3qQaEOMbkSETl+1X+mfs637M/CazsUgB4O2lm21KaVSxkSNcAwixCc0
 SgTYm68ui15/f0GFRRZ++yRyK17iqs/kqqD5nA8yrFC1a70mI5Ygp+GD5az4U/ujdB
 sD4uRZffzhEmiHhAs1dK5nZiLkXRW8/sjPpUXcM6iqk9AzpP1fHH6wip8FMHFhgjRg
 yUo71RvQ0qEbMIqqrbWyMCnGjxv3mKTFek7KrCyi67lX95wy3H+WPsLbKXkIm9iKQr
 mLWia703Eh0HuzmJQXjHEe2hp8A7k+dPBDvHFsp4mPfpgvlirV2iFg/w5IKxaY/5JG
 wXxvj9iQvk2iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9B68EC6445A; Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] dt-bindings: riscv: deprecate riscv,isa
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102263.23922.9146715518598128204.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230702-eats-scorebook-c951f170d29f@spud>
In-Reply-To: <20230702-eats-scorebook-c951f170d29f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alistair.francis@wdc.com,
 ajones@ventanamicro.com, apatel@ventanamicro.com, atishp@atishpatra.org,
 jrtc27@jrtc27.com, rick@andestech.com, ycliang@andestech.com,
 oleksii.kurochko@gmail.com, qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, robh@kernel.org
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=patchwork-bot+linux-riscv@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jul 2023 20:41:52 -0400
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun,  2 Jul 2023 00:10:01 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> intro
> =====
> 
> When the RISC-V dt-bindings were accepted upstream in Linux, the base
> ISA etc had yet to be ratified. By the ratification of the base ISA,
> incompatible changes had snuck into the specifications - for example the
> Zicsr and Zifencei extensions were spun out of the base ISA.
> 
> [...]

Here is the summary with links:
  - [v5] dt-bindings: riscv: deprecate riscv,isa
    https://git.kernel.org/riscv/c/aeb71e42caae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



