Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pINkr-00022y-4i
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 00:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pINkj-0001zZ-2k
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 00:46:21 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pINka-0005Vr-7u
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 00:46:20 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mg12so2871135ejc.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 21:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eYW57Deql4eJBVjxcSWp1qgA6sFHWROrBxgMBsl7eOA=;
 b=Kt/9Vo1lBopkXduMFsS+DPYKQF0yTOSPvPwnHGRGiJmadNNPq3I2SRg8WyBOMXDqwE
 zmJVc8/AZaBxkEF/wt/XfUf/Ihu8frVCYZfay2xmuzAeHK+PJqyu55uEXEYemEnK8JEm
 iGKMLwoV+HK5i8Jvn5TTUETU+m0nMoA9KDKb9IeJDj05zQcjwoQ7i7cBFRLXDWJA43Fi
 h04c/z/SPEjUd5tid9Dy2wF2vPM1c8VxW+fNrrC2e87dxRXl1YTiRg1mwijZAw6m7Dky
 MgujOYjwUwdfD3WSl13HQBpz9uvECnC37Q8jWmIMX+odpNp9UZdm2qd7MWA9hUVoSS9g
 y7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYW57Deql4eJBVjxcSWp1qgA6sFHWROrBxgMBsl7eOA=;
 b=VaqltPd+INlM/kqucYHLpOlE5ypIKfKZY5kYXcaGYisNBUKDgyAlh8eWT34xCCbshv
 Ue3dC2FP2QXpofnnd0YKyvV6Nf5OzGk56bnXGKxd7QRVqoXK7lk3tTdr/rzUVkSKsUQN
 NeurtjN2bRy69fcPMCGVSs0RpMr1DSozlygj51mhs8ha1/+Ig6BXPwawILYY6QGWoxUu
 2m5iz3dauPKJubU9ex3ZODIJtt6JrYlQiy3l+DMUZi+HWSXHDsSNjegZhL1nCZ0TMsnP
 Dl4kTIUFD8VHbXYOtF+I4wjBbXsNnCnd2SG2qY6YVYTg8fQVgMmXtLxcHesUOPZ19AEW
 8kxw==
X-Gm-Message-State: AFqh2kqT5GbOwHeA6oHvXaSy+fzHn/8jVhdLP8IAL7FFIiqFsPsnTo2I
 98DEeD7eshL/axhG7LNfrz9kXWtubiDaM65G1lw=
X-Google-Smtp-Source: AMrXdXumrtNkQnsVdmTb0sK+fc4anl5+DaLkCO4WcwtMhzVHYa7/SBssffRxcNUQbd2VDxJWHxJiKr6HUuHUOywM7cY=
X-Received: by 2002:a17:906:829a:b0:86c:f7ac:71f5 with SMTP id
 h26-20020a170906829a00b0086cf7ac71f5mr621852ejx.217.1674107165284; Wed, 18
 Jan 2023 21:46:05 -0800 (PST)
MIME-Version: 1.0
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
 <Y8BLZLw6gP4hUpyy@spud>
 <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
 <2882065D-831B-4E8C-BFD3-677BB8ECA2AD@kernel.org> <Y8K8b75lWE2eXZwz@spud>
In-Reply-To: <Y8K8b75lWE2eXZwz@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Jan 2023 13:45:58 +0800
Message-ID: <CAEUhbmWuXChi+w8e0igqppAdqi=2SLzwyd6te2se-PY-B9De0g@mail.gmail.com>
Subject: Re: qemu icicle kit es
To: Conor Dooley <conor@kernel.org>
Cc: stage TC <stagethalescristal@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 19 Jan 2023 05:46:22 -0000

Hi Conor,

On Sat, Jan 14, 2023 at 10:30 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Jan 13, 2023 at 12:56:57PM +0000, Conor Dooley wrote:
> >
> >
> > On 13 January 2023 00:35:11 GMT, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >On Fri, Jan 13, 2023 at 2:03 AM Conor Dooley <conor@kernel.org> wrote:
> > >>
> > >> +CC Bin Meng
> > >>
> >
> > >> Bin Meng, you're listed as a supporter (in master anyway) but is that
> > >> still accurate? I figure there's a good chance it isn't anymore?
> > >> Have you tested the platform from HSS init at all lately?
> > >
> > >Yes, I am still maintaining the QEMU PolarFire SoC. The WiKi page
> > >listed the exact HSS version I tested and if it doesn't, it should be
> > >a regression in QEMU. If yes, I would like to have a look at that.
> >
> > That'd be great.
> > I submitted a few patches for fixing the direct kernel boot & hopefully
> > haven't broken anything!
> > I'll try to test it also, if I get some time.
>
> Gave 7.2.0 a go yesterday afternoon.
> The URL from the documentation is no longer accessible, I cannot wget
> the image! I'll try and find out what happened there, AFAIU that FTP is
> still in use, so dunno why that file doesn't seem to be there.
> I'll try to find out.
>
> I dug out the commit from the docs for the HSS, built that. Generated a
> payload using the nearest payload generator commit to that was
> compilable, which I passed as the image instead of the wic.
>
> The HSS would load, get as far as trying to extract the payload
> containing the next stage bootloader & fail. Specifically, it was
> complaining that the magic number for the payload was all zeros.
>
> Perhaps if you still have the original wic image you'll have more luck!
>
> Thanks,
> Conor.
>
> | qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
> |     -bios path/to/hss.bin -sd path/to/sdcard.img \
> |     -nic user,model=cadence_gem \
> |     -nic tap,ifname=tap,model=cadence_gem,script=no \
> |     -display none -serial stdio \
> |     -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
> |     -serial chardev:serial1
>
> btw, I built my QEMU with `./configure --target-list=riscv64-softmmu &&
> make`, and got a complaint from the above command that user mode NICs
> were not present in my QEMU.
>

The user mode NICs issue is because since QEMU 7.2, libslirp
dependency was changed to an external build host dependency, so you
need to manually install via something like "apt install libslirq-dev"
in Ubuntu.

Regards,
Bin

