Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdw0l-0007Qj-6r
	for mharc-qemu-riscv@gnu.org; Sat, 14 Nov 2020 08:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1kdshc-0002Vb-GQ
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 05:22:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1kdsha-000435-3g
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 05:22:40 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D902A22252;
 Sat, 14 Nov 2020 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605349355;
 bh=DTAwl0hTrgRNPZ3g+vwkAlwE0PTRvx4ZwzKkvuUCxr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C18I0LTVOcMsZtu/D5bylPumO8f8Nv2DLt9F8OyjoeMYwBWEyrvkd9nZ3U42ecTAP
 dKZ4KKAddKzsHAn6n6EomSTPCaozy0YPoORQspiNxwEmDJzHKZ/Gr7JWWi0ifU4f+s
 p+IHjEs9d3zGxrcCBXfQq5cZdDPfxpiFsOMD5Lv8=
Date: Sat, 14 Nov 2020 11:23:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: =?utf-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
 Roman Kiryanov <rkir@google.com>, Huacai Chen <chenhuacai@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, Lingfeng Yang <lfy@google.com>,
 Rob Herring <robh@kernel.org>, anup.patel@wdc.com,
 Alistair.Francis@wdc.com, qemu-riscv@nongnu.org
Subject: Re: Re: [PATCH] drivers: rtc: retire RTC_DRV_GOLDFISH
Message-ID: <X6+wGMUCCpu2liYR@kroah.com>
References: <20201113205233.827493-1-rkir@google.com>
 <20201113210730.GA1992396@bogus>
 <CAOGAQeq29S06+6M58qF0e4ivjzkZDg4+M7ffSK+FapbgmCBrLQ@mail.gmail.com>
 <CAL_Jsq+QjQxDh3_KDhgE_2A6DjA+gSyvknjrVfRFLMLz-p_M9A@mail.gmail.com>
 <CAOGAQepCsj63yZzJJHKCdHTenkWNLc_v=Ab6PgvS3hzqZMwH8A@mail.gmail.com>
 <CAOGAQepW3pbbjK9KpPZR1BwGY-CGF7V_pTY_9dw98XPgUKYFHg@mail.gmail.com>
 <X68aZ/Dgm7CObQmH@kroah.com>
 <tencent_3801BEAE39670E174105E007@qq.com>
 <X6+SKQS6QJr25kF0@kroah.com>
 <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=gregkh@linuxfoundation.org; helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 05:22:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 14 Nov 2020 08:54:36 -0500
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
X-List-Received-Date: Sat, 14 Nov 2020 10:22:40 -0000

On Sat, Nov 14, 2020 at 05:47:47PM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/11/14 下午4:15, Greg KH 写道:
> 
> + qemu-riscv list and QEMU device maintainers of goldfish_rtc
> 
> > On Sat, Nov 14, 2020 at 04:06:24PM +0800, 陈华才 wrote:
> > > Hi, All,
> > > 
> > > Goldfish RTC works well on MIPS, and QEMU RISC-V emulator use Goldfish
> > > as well, so I think  we should keep it in kernel.
> > But does anyone actually use it for anything?  Having something in qemu
> > is nice, but not required if it doesn't provide something that is
> > already there for other virtual devices, right?
> 
> Hi all,
> 
> Both QEMU MIPS loongson3-virt and riscv virt machine are using goldfish_rtc
> as sole RTC
> device, it have been hardcoded in QEMU for a long while and sudden drop in
> kernel would
> break these machines.
> RTC is essential for virt machines to keep time synchronized with host.
> 
> Given that it is the simplest RTC implementation for now, it won't give us
> much maintenance
> overhead.
> 
> Thus I do think it shouldn't be retired as for now. If nobody comes in I'd
> also willing to maintain
> it.

Ok, can someone submit a patch to update the MAINTAINERS file for this
so we know who to route issues to over time?

thanks,

greg k-h

