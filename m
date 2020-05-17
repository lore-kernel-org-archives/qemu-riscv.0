Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaN3z-0006kQ-84
	for mharc-qemu-riscv@gnu.org; Sun, 17 May 2020 13:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaN3x-0006jD-0B
 for qemu-riscv@nongnu.org; Sun, 17 May 2020 13:26:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaN3w-000662-3y
 for qemu-riscv@nongnu.org; Sun, 17 May 2020 13:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589736415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=10XxOGKrmTpGZtgTI3efNNlk3/0TULQ+VOPtrrNccZI=;
 b=KLblbCHN0oxt4FboHsiedWEKgt0GPZJNyMUBpm9a+PCDhi00xL9rhkffD+mX66+gmUCwd0
 pAY2jatfEzowfYgl4Jl357r1lSTNFcFCRJMdPr3ybM3zLtlbToZ3XyLAbduFB0Q4jvcwWg
 GPzuOOdz6ChifYZ1u43fd3Q1QIdYT80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-DghnPjlPMza4NBgRzkZtjg-1; Sun, 17 May 2020 13:26:53 -0400
X-MC-Unique: DghnPjlPMza4NBgRzkZtjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB0380B700;
 Sun, 17 May 2020 17:26:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B2A1001925;
 Sun, 17 May 2020 17:26:46 +0000 (UTC)
Subject: Re: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
Date: Sun, 17 May 2020 19:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 13:26:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Sun, 17 May 2020 17:26:57 -0000

On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd88a3de49..659092eb43 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -415,6 +415,15 @@ S: Supported
>  F: target/i386/kvm.c
>  F: scripts/kvm/vmxcap
>  
> +Guest CPU Cores (other accelerators)

Maybe s/other accelerators/accelerators generic code/ ?

> +------------------------------------
> +Overall
> +M: Richard Henderson <rth@twiddle.net>
> +R: Paolo Bonzini <pbonzini@redhat.com>
> +S: Maintained
> +F: include/sysemu/accel.h
> +F: accel/stubs/Makefile.objs

What about accel/accel.c and accel/Makefile.objs ? Should they also be
in the list here?

 Thomas


