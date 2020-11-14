Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ke6zU-0007jf-0G
	for mharc-qemu-riscv@gnu.org; Sat, 14 Nov 2020 20:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkir@google.com>) id 1ke3do-0002Ut-Qo
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 17:03:30 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkir@google.com>) id 1ke3dm-0002vs-7H
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 17:03:28 -0500
Received: by mail-lf1-x142.google.com with SMTP id 74so19352939lfo.5
 for <qemu-riscv@nongnu.org>; Sat, 14 Nov 2020 14:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tw519QnQqGiK6rupN/NcEfOuWk4WM7fN7+syGC2XjjA=;
 b=iRILio44OnjOmHzJbJnSRFvxcXfEg4UAb+d90OWmiWRGzN5lWl10mUvVXSv1ekhfFg
 g+c1PWrUK0ZEiZGHXqLPLpC4XPEqpZbhje+5ZSoLxHFCv6axPBQfGb38bu5sfBj4tXwJ
 0Ad7VqeKTxbRYDZ0b2jvnRFXDSV02KjcrxelUQYdb/diEONb1incflBsfMi5Lqq7f9A8
 QzxHwmW9vbAgMEeMGMfpIk0/DOK5rZMGWoiANcIbJOsK+LCIu6RMxUg+ZFIoCO10elaS
 qEPbCIY6ZSy0T+Lxc5Z4K7KwVPD2tT78sH+jmGAfosWwETu6bFgl4QbIOwgelHw83PaQ
 SncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tw519QnQqGiK6rupN/NcEfOuWk4WM7fN7+syGC2XjjA=;
 b=KnQzE/Qj4FpYztbDgKtzYmKPu2GMDmLodJIBdjTeMyN2ELfZuj9kOHu3vz9ULXYEmp
 owHghpO6uZAEEm2zf7WSIJ1l2EFYo3Eu07Rjk//6Tx4bJLYVZohu5O8Bl9n6FYSU0yBq
 TurPDL5c+4k/LWLlRfbqZDpF8x77ZOKXBIfGbxDkXB5mbLgEqCxKZU9/dHT5f8o3ribv
 PEp8wIZxdCSTBaPckuwRyhUc42IEJ9kyywYorcGa11hPR65ar8fLOtJSkS4CmToEGLtB
 gkRgymNFuOStZObYybQRJ+YJ5CO2aaCF/umvMfWgLijoGUF6vSNWrgaghHkr7TRt3NcR
 dyyg==
X-Gm-Message-State: AOAM533U9pYKbJFkJO6Dn0c7/Gv1zQgcchxMqlX48Vr2ghA5MYzbkAxz
 BGDyYmoldIeJy7srPCH9qhCWcBwIXf2O3mIPaywa4Q==
X-Google-Smtp-Source: ABdhPJxuieUCZuZY4/FA3Rv67o1ZRi+jEL8ixsARtgSR69Qd6QooGRmk1cuVPtNz3SmeIRGmGfr/S1QBdrtUKG7Qc+w=
X-Received: by 2002:a19:9c7:: with SMTP id 190mr2795765lfj.545.1605391398863; 
 Sat, 14 Nov 2020 14:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20201113205233.827493-1-rkir@google.com>
 <20201113210730.GA1992396@bogus>
 <CAOGAQeq29S06+6M58qF0e4ivjzkZDg4+M7ffSK+FapbgmCBrLQ@mail.gmail.com>
 <CAL_Jsq+QjQxDh3_KDhgE_2A6DjA+gSyvknjrVfRFLMLz-p_M9A@mail.gmail.com>
 <CAOGAQepCsj63yZzJJHKCdHTenkWNLc_v=Ab6PgvS3hzqZMwH8A@mail.gmail.com>
 <CAOGAQepW3pbbjK9KpPZR1BwGY-CGF7V_pTY_9dw98XPgUKYFHg@mail.gmail.com>
 <X68aZ/Dgm7CObQmH@kroah.com> <tencent_3801BEAE39670E174105E007@qq.com>
 <X6+SKQS6QJr25kF0@kroah.com>
 <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
 <X6+wGMUCCpu2liYR@kroah.com>
In-Reply-To: <X6+wGMUCCpu2liYR@kroah.com>
From: Roman Kiryanov <rkir@google.com>
Date: Sat, 14 Nov 2020 14:03:07 -0800
Message-ID: <CAOGAQeoqSXwWyo_hgY4ru+WyxLjHuMv9m0cmoA7O+-pEUEZryg@mail.gmail.com>
Subject: Re: Re: [PATCH] drivers: rtc: retire RTC_DRV_GOLDFISH
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>, 
 Huacai Chen <chenhuacai@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 LKML <linux-kernel@vger.kernel.org>, Lingfeng Yang <lfy@google.com>, 
 Rob Herring <robh@kernel.org>, anup.patel@wdc.com, Alistair.Francis@wdc.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=rkir@google.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 14 Nov 2020 20:38:02 -0500
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
X-List-Received-Date: Sat, 14 Nov 2020 22:03:30 -0000

> > Thus I do think it shouldn't be retired as for now. If nobody comes in I'd
> > also willing to maintain
> > it.
>
> Ok, can someone submit a patch to update the MAINTAINERS file for this
> so we know who to route issues to over time?

I will send a patch to update MAINTAINERS for goldfish-rtc.

