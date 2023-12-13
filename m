Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C575C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:46:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDNgz-0008Ta-Sk; Wed, 13 Dec 2023 06:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDNgx-0008Si-L8; Wed, 13 Dec 2023 06:46:19 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDNgu-0003gS-Bq; Wed, 13 Dec 2023 06:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtpOsuYUMuv5LJ+ykgRi0X0Di76O8xp4u68L9ecrMHM=; b=nXDy39yoOPDL+b6DmXloOz8a/M
 bjUS7he5ag7pKfvlBt7Tx1Obt3xYNwprv6mH+lEFgalkTz6hTXufwBrEEIptPDbeVOIZmtO4HDbWY
 7Yh/JqnPhMJTjFXtjubvsY+bm65c5CbGIq9bNQaiXLzYbqy9PhmUWepffr/vooKfLcgs=;
Date: Wed, 13 Dec 2023 12:46:03 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Brian Cain <bcain@quicinc.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 08/23] host/load-extract: Include missing
 'qemu/atomic.h' and 'qemu/int128.h'
Message-ID: <hzcm67xbdgtskwqs2vsn6rbpb3s6iftabl5awgnkc6y6jyyxc6@qf3fvojrkxoo>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-9-philmd@linaro.org>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 12/12/23, Philippe Mathieu-Daudé wrote:
> int128_make128(), int128_getlo() and int128_urshift() are
> declared in "qemu/int128.h". qatomic_read__nocheck() is
> declared in "qemu/atomic.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  host/include/generic/host/load-extract-al16-al8.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
> index d95556130f..6b47339b57 100644
> --- a/host/include/generic/host/load-extract-al16-al8.h
> +++ b/host/include/generic/host/load-extract-al16-al8.h
> @@ -8,6 +8,9 @@
>  #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
>  #define HOST_LOAD_EXTRACT_AL16_AL8_H
>  
> +#include "qemu/atomic.h"
> +#include "qemu/int128.h"
> +
>  /**
>   * load_atom_extract_al16_or_al8:
>   * @pv: host address
> -- 
> 2.41.0
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>

