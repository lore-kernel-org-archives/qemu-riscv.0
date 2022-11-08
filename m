Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osPur-0004Op-M7
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 09:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1osPup-0004Od-QS
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 09:49:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1osPuk-0007l9-Tz
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 09:49:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id 21so22867632edv.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TX55RcZFODLRpBQp7mImEqmVNrtuS2jiyxO2W/P4eis=;
 b=JB6Er2b+Q1N3wD2RnI6Jv5jRdkTPCVdIbLZqMP0sZ8OAnotyTieHnuAOE4j2hklPss
 l7XS16oCOXfZe31u+JTwGYOXXrTaKS/SLT5Kz+IORdPPU6UjiYzGwxiYWBfG8+loqUHO
 1bm4rDkIKBR78txerWN6sRx7HgG1cr3908D7V3AYi2tcTyckJOoECpyVOQEuMt22q1/C
 06GY3QuQSrTNUU04GWphytYhFA5XxznTQkaURijAwuv5AT9L4the8G+gsXHxRwDciLRb
 Iz4xiJXoA+tvidNy3ijcEXVFl8+geKQPxvQuka25IeKPFmrspTcnmKOU9SQo89nSZMvc
 Zckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TX55RcZFODLRpBQp7mImEqmVNrtuS2jiyxO2W/P4eis=;
 b=FvabIazQQPQMK7SGpmWAcKj+3dhlcTQo27tvRKe7Nmy8ZvkkFsT++/yTHmBaCO9Ua8
 L4C9+a/dHeh6sEg4BA39iNgChb+LFY1Hoc/VaR13T3RfqS6vw+2/0c9fO9+AHDtGTXr0
 OEFGUp13I7IRDn+58UuDvYnSQ4SEuRZEmhFHpiJ6a1Yf1bWn7V26DHQ7NzANd5oqD/Mv
 VhgYSrrsrEjIY/DJl9Y1kItVraSoM1BnQdW+c07Wz+qG+L+wALocYs/Ki52wcYm7t2ft
 YXoFMPl6E1j3uTEdHn6tZu8LFq3vb+xxLqiJaQKTMkcdnHq+lMmztG/rFtLgxjvTEyXm
 KruA==
X-Gm-Message-State: ACrzQf2S1eF7Ofj8FQMpn4rwXW+kGy9zk0WyGaTwpo/IhVpZdedzdJwy
 tpyR8Rr/wfoS1jNhZ6NqvxvpJg==
X-Google-Smtp-Source: AMsMyM6OQH+4V9TOArlqFNFRbiEozUGbbqIY35xXDej6oQp9ZgT88shaW+hq/mLqJ+ijHP2o1FPXaw==
X-Received: by 2002:a50:e616:0:b0:461:fc07:b630 with SMTP id
 y22-20020a50e616000000b00461fc07b630mr55893499edm.219.1667918961166; 
 Tue, 08 Nov 2022 06:49:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a056402048e00b00456c6b4b777sm5591188edv.69.2022.11.08.06.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 06:49:20 -0800 (PST)
Date: Tue, 8 Nov 2022 15:49:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221108144919.3t2ryv5mbzfvgm3k@kamzik>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com>
 <20221107173201.343hkqqugkzdzqcf@kamzik>
 <Y2lBnPuUA4bgKCLL@redhat.com>
 <934d7560-daee-9f7e-2abb-640575768b2f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934d7560-daee-9f7e-2abb-640575768b2f@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Nov 2022 14:49:28 -0000

On Tue, Nov 08, 2022 at 03:12:42PM +0100, Philippe Mathieu-Daudé wrote:
> On 7/11/22 18:34, Daniel P. Berrangé wrote:
> > On Mon, Nov 07, 2022 at 06:32:01PM +0100, Andrew Jones wrote:
> > > On Mon, Nov 07, 2022 at 04:19:10PM +0000, Daniel P. Berrangé wrote:
> > > > On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
> > > > > 
> > > > > Sunil V L <sunilvl@ventanamicro.com> writes:
> > > > > 
> > > > > > On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> > > > > > > On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > > > > 
> > > > > > > > The pflash implementation currently assumes fixed size of the
> > > > > > > > backend storage. Due to this, the backend storage file needs to be
> > > > > > > > exactly of size 32M. Otherwise, there will be an error like below.
> > > > > > > > 
> > > > > > > > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> > > > > > > > 
> > > > > > > > Fix this issue by using the actual size of the backing store.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > > > ---
> > > > > > > 
> > > > > > > Do you really want the flash device size presented to the guest
> > > > > > > to be variable depending on what the user passed as a block backend?
> > > > > > > I don't think this is how we handle flash devices on other boards...
> > > > > > > 
> > > > > > 
> > > > > > Hi Peter,
> > > > > > 
> > > > > > x86 appears to support variable flash but arm doesn't. What is
> > > > > > the reason for not supporting variable size flash in arm?
> > > > > 
> > > > > If I recall from the last time we went around this is was the question
> > > > > of what you should pad it with.
> > > > 
> > > > Padding is a very good thing from the POV of upgrades. Firmware has shown
> > > > a tendancy to change (grow) over time, and the size has an impact of the
> > > > guest ABI/live migration state.
> > > > 
> > > > To be able to live migrate, or save/restore to/from files, then the machine
> > > > firmware size needs to be sufficient to cope with future size changes of
> > > > the firmware. The best way to deal with this is to not use the firmware
> > > > binaries' minimum compiled size, but instead to pad it upto a higher
> > > > boundary.
> > > > 
> > > > Enforcing such padding is a decent way to prevent users from inadvertantly
> > > > painting themselves into a corner with a very specific firmware binary
> > > > size at initial boot.
> > > 
> > > Padding is a good idea, but too much causes other problems. When building
> > > lightweight VMs which may pull the firmware image from a network,
> > > AArch64 VMs require 64MB of mostly zeros to be transferred first, which
> > > can become a substantial amount of the overall boot time[*]. Being able to
> > > create images smaller than the total flash device size, but still add some
> > > pad for later growth, seems like the happy-medium to shoot for.
> > 
> > QEMU configures the firmware using -blockdev, so can use any file
> > format that QEMU supports at the block layer.  IOW, you can store
> > the firmware in a qcow2 file and thus you will never fetch any
> > of the padding zeros to be transferred.  That said I'm not sure
> > that libvirt supports anything other than a raw file today.
> 
> Drew might be referring to:
> 
> https://lore.kernel.org/qemu-devel/20210810134050.396747-1-david.edmondson@oracle.com/

I was thinking of a different one, but thanks for the reference to this
one. Daniel's qcow2 proposal sounds like something worth investigating,
since some padding makes sense, but the guess for how much will likely
be wrong one direction or the other.

Thanks,
drew

> 
>  > Currently ARM UEFI images are typically built as 2MB/768kB flash
>  > images for code and variables respectively. These images are both
>  > then padded out to 64MB before being loaded by QEMU.
>  >
>  > Because the images are 64MB each, QEMU allocates 128MB of memory to
>  > read them, and then proceeds to read all 128MB from disk (dirtying
>  > the memory). Of this 128MB less than 3MB is useful - the rest is
>  > zero padding.
>  >
>  > On a machine with 100 VMs this wastes over 12GB of memory.
> 
> See previous attempts:
> - Huawei
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
> - Tencent
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
> - Oracle
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg760065.html
> - Red Hat
> https://www.mail-archive.com/qemu-block@nongnu.org/msg81714.html
> 

