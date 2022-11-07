Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os5zC-0003qD-Vh
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 12:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1os5yr-0003ly-0m
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 12:32:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1os5yg-0003Un-2v
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 12:32:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y16so17260734wrt.12
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qNv3MLrhOuehbV0KfMJPuXTOFXlXOml5knQjI4GLOXk=;
 b=gqj+3GyqKr80i0YufZzTgBFTKpIZEdQhByndpmh6uP1RSw1hf89vKn2BWfHgBS3KP/
 M8NPgYKW0CKFu0mhuda7WXgeWaxGH/UnsTZgX8ptFDJSeYCrRcXRDAykEf/MU7Ae2w7p
 UjqOZah7C1Q9h2E2t/sWXf5hRbDvIYUAE1nI1HjoODsdfAJovjClYca6nleFPxBMLaRi
 ufnvM62qH8iRWe69J8q/qmTApEdP2DUC2MhwOhxJP8CMHeHyM1MsBG+Z+JlYJk7W4vu3
 2hDNbtuV/lzEK5csgjTnFaAsn79MwbrY+y1HSP3VrRVT0N6LjlHaOSgw3mDiUbuATEgr
 8d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNv3MLrhOuehbV0KfMJPuXTOFXlXOml5knQjI4GLOXk=;
 b=lIK4JGUaopuF1L3c0/KTEledIVuwZbzxJ2TR4gJKSp2M09UV0EsPYyZ8gFJUFsHufQ
 VoIOR9qygmb4oid+F1xz4QwGeJ74eNFB0JQe7x6oFL+9nltEKBCcpIaGfYEtTMtxT8IK
 ogDsqTq8nTTikGlrybQdBQRQcatG9/4/OxYlfYRbwHGGnbdD5o7/J5AV14EAaA4nx3cr
 9j5bTCnB//B8bV5Z2n9y3ZWV1LuP68fuk7QF13nykFr8aNL7POkFWVqj8npi5rXJoxu3
 Sfo1zPGgrKNGt2+J8Du8CR2HVcadv/ajeGjNab6Y9JD3rEWRNU+nGnXmLY+iBIWpL6zn
 ZIVw==
X-Gm-Message-State: ACrzQf2QygfaexgnBRfrWVwxM5UzKHfQVsAUslBaB/JhFALl/3Ooi4/6
 F7hS3HnTqfmsHUCv/xGbDFzaNQ==
X-Google-Smtp-Source: AMsMyM6NjVPXxZ/SAud4RaoLpUVHSRzudmWE2jTWldc8wr9dvBrqHekCf1CW61WSuMNYip1GzGcLzg==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id
 a6-20020adfeec6000000b00236aabb8c90mr25155404wrp.199.1667842323077; 
 Mon, 07 Nov 2022 09:32:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00236e834f050sm7739752wro.35.2022.11.07.09.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:32:02 -0800 (PST)
Date: Mon, 7 Nov 2022 18:32:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221107173201.343hkqqugkzdzqcf@kamzik>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2kv/k5oKGOd+90w@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 07 Nov 2022 17:32:22 -0000

On Mon, Nov 07, 2022 at 04:19:10PM +0000, Daniel P. Berrangé wrote:
> On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
> > 
> > Sunil V L <sunilvl@ventanamicro.com> writes:
> > 
> > > On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> > >> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >> >
> > >> > The pflash implementation currently assumes fixed size of the
> > >> > backend storage. Due to this, the backend storage file needs to be
> > >> > exactly of size 32M. Otherwise, there will be an error like below.
> > >> >
> > >> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> > >> >
> > >> > Fix this issue by using the actual size of the backing store.
> > >> >
> > >> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > >> > ---
> > >> 
> > >> Do you really want the flash device size presented to the guest
> > >> to be variable depending on what the user passed as a block backend?
> > >> I don't think this is how we handle flash devices on other boards...
> > >> 
> > >
> > > Hi Peter,
> > >
> > > x86 appears to support variable flash but arm doesn't. What is
> > > the reason for not supporting variable size flash in arm?
> > 
> > If I recall from the last time we went around this is was the question
> > of what you should pad it with.
> 
> Padding is a very good thing from the POV of upgrades. Firmware has shown
> a tendancy to change (grow) over time, and the size has an impact of the
> guest ABI/live migration state.
> 
> To be able to live migrate, or save/restore to/from files, then the machine
> firmware size needs to be sufficient to cope with future size changes of
> the firmware. The best way to deal with this is to not use the firmware
> binaries' minimum compiled size, but instead to pad it upto a higher
> boundary.
> 
> Enforcing such padding is a decent way to prevent users from inadvertantly
> painting themselves into a corner with a very specific firmware binary
> size at initial boot.

Padding is a good idea, but too much causes other problems. When building
lightweight VMs which may pull the firmware image from a network,
AArch64 VMs require 64MB of mostly zeros to be transferred first, which
can become a substantial amount of the overall boot time[*]. Being able to
create images smaller than the total flash device size, but still add some
pad for later growth, seems like the happy-medium to shoot for.

[*] My web searching skills are failing me at the moment, but I recall
seeing a BZ or gitlab/github issue specifically pointing out the AArch64
64MB firmware size as a pain point.

Thanks,
drew

