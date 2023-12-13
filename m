Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BA0C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDNao-0005uF-I7; Wed, 13 Dec 2023 06:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDNI2-000218-2u; Wed, 13 Dec 2023 06:20:34 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDNHz-0004pN-Q0; Wed, 13 Dec 2023 06:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ppt/ddrAQrRUY856oSykvJQUIFjAlxTZkZOYQ+t2gDk=; b=xk8sKxxxaHqLiqiFv8zWZLxmf5
 P2Q9ATwaPas8xHziyQZCrKT+zzTjmqb0t1mb52a2WSATeIKHcPdOnqDNcxCL4VYQZl1ukCiOExpsf
 idfhoJKK8aKQpcdDOuVHZ+DWnpW0Wbwz0huxwFIb8EcgJgOQyV93c4hqcPHiBIovvR0M=;
Date: Wed, 13 Dec 2023 12:20:15 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Brian Cain <bcain@quicinc.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 15/23] exec: Declare target_words_bigendian() in
 'exec/tswap.h'
Message-ID: <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-16-philmd@linaro.org>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Dec 2023 06:39:57 -0500
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
> We usually check target endianess before swapping values,
> so target_words_bigendian() declaration makes sense in
> "exec/tswap.h" with the target swapping helpers.
> 
> Remove "hw/core/cpu.h" when it was only included to get
> the target_words_bigendian() declaration.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/tswap.h     | 12 +++++++++++-
>  include/hw/core/cpu.h    | 11 -----------
>  cpu-target.c             |  1 +
>  disas/disas.c            |  1 +
>  hw/audio/virtio-snd.c    |  2 +-
>  hw/core/cpu-sysemu.c     |  2 +-
>  hw/core/generic-loader.c |  2 +-
>  hw/display/vga.c         |  2 +-
>  hw/virtio/virtio.c       |  1 +
>  9 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/include/exec/tswap.h b/include/exec/tswap.h
> index 68944a880b..77954bbc2b 100644
> --- a/include/exec/tswap.h
> +++ b/include/exec/tswap.h
> @@ -8,9 +8,19 @@
>  #ifndef TSWAP_H
>  #define TSWAP_H
>  
> -#include "hw/core/cpu.h"
>  #include "qemu/bswap.h"

This breaks system/qtest.c which gets first_cpu from hw/core/cpu.h 
through the inclusion of tswap.h...

../system/qtest.c:548:33: error: ‘first_cpu’ undeclared (first use in this function);
  548 |             address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
      |                                 ^~~~~~~~~

Adding hw/core/cpu.h to system/qtest.c seems sufficient.

Otherwise,
Reviewed-by: Anton Johansson <anjo@rev.ng>

