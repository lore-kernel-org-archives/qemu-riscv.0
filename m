Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os2ni-00071D-MX
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 09:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os2ni-00070o-5m
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 09:08:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os2ng-00010N-FG
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 09:08:33 -0500
Received: by mail-pl1-x629.google.com with SMTP id j12so11156218plj.5
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 06:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lOcqtD2BP4tyB/GtYPI7EiqQoPm8QHujQwf9AHtESSc=;
 b=PvWCSIIv+bSt1l6xhMnesgTPlfoRwSBdpZy6Ft0spbqBf39k8DWz5GiQKhTem04sqN
 /3YOF8KT426dp3Wt6+4+bNLJ5O1b31cIVLh30D0dA6WY+4JAkjfPsJ/ejpPD2d+9i69w
 dFvQ8ggybgvyWUg70bQGlD0miZFSNBnQ9AbKOho9Du3+DjoKVAnJYrFcaCpVjP8Z4CgC
 uuVKSJD1+RCkoTWhdIXEqjA/1LU1fvOTx5HWFlu9iJp3l6woYMRojG5mkM9bSmccBZU9
 KKfhC4uiT9B0fhyX0bDpCd2HjgJA4L7Oxq9aLBTJdOv2OS6MwS92mpEGcMgJVV8Un7Al
 aIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOcqtD2BP4tyB/GtYPI7EiqQoPm8QHujQwf9AHtESSc=;
 b=ySTdDpA6PDqvauclnxmviLVmtd9QPzqYCAsP2tcWu00h7kDGMTjnhHrrKn/KesQUQm
 gqRIOropr6tqkAI4kNgkEQQa1HWLkK/csjT5Fu9kH+sC0sPneZrgrlWrdbGGZOIyCohs
 vlU+9KzNLMCSZK2CJHrl3J2PvrRhjIEFMK+wwf7l1WJIBfl7pt/bI7/7OUiERdAa0RmU
 7GlaPmILzlv/DZKGKo27z/KVBTpjBTC0UQ1Z0KuoVdspDwYbB+STxiGBIafJCqEnN09U
 g9d0ksyjcqNr5zKmvIP629jp+hWHGlEjUrYpgudic++Y0jtextXY4ov6v+bN/r8Zujyk
 qytw==
X-Gm-Message-State: ACrzQf1jKNJqGYjB/AfD2aBQsnEz2Nky1UBYyeW1jAo8n7pCTlO7MrGU
 5IqCvkQ3Aho/fF7RWLcpJ49Byw==
X-Google-Smtp-Source: AMsMyM4+V6Er7lGfaHrgpK1v0uXtMfOZMYDyFVYCnhKf66GQiBgr4aVu2luHrL9ENjZkUEAMmhkGuQ==
X-Received: by 2002:a17:902:e84e:b0:186:b699:d4ab with SMTP id
 t14-20020a170902e84e00b00186b699d4abmr50210109plg.116.1667830111201; 
 Mon, 07 Nov 2022 06:08:31 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 g74-20020a62524d000000b0055f209690c0sm4537805pfb.50.2022.11.07.06.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:08:30 -0800 (PST)
Date: Mon, 7 Nov 2022 19:38:24 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2kRWNnk7wDxPnBK@sunil-laptop>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 07 Nov 2022 14:08:34 -0000

On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > The pflash implementation currently assumes fixed size of the
> > backend storage. Due to this, the backend storage file needs to be
> > exactly of size 32M. Otherwise, there will be an error like below.
> >
> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> >
> > Fix this issue by using the actual size of the backing store.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> 
> Do you really want the flash device size presented to the guest
> to be variable depending on what the user passed as a block backend?
> I don't think this is how we handle flash devices on other boards...
> 

Hi Peter,

x86 appears to support variable flash but arm doesn't. What is
the reason for not supporting variable size flash in arm?

Thanks
Sunil

