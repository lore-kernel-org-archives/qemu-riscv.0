Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Szp-0005s8-NE
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 16:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o8Ss0-0002JX-Tn; Mon, 04 Jul 2022 16:40:36 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o8Srz-0006lN-Dd; Mon, 04 Jul 2022 16:40:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so319222pjr.4; 
 Mon, 04 Jul 2022 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Be3C99dMG8I/iZmt56ebO++H26LE0Tt/O2nc5E40T3o=;
 b=DJtfHF0iKJK986V6cznPBjeMYjBVlCKEBdW4EqiCpXdr6I0rPkyJbsCtv4TdCvGFbN
 c1lEUBYpdTM7Dr6gCUxxkgYV92tPdFZtLKfwB6wBut6mDHCRiw7AawrClTvTEqSoGDhT
 z6RgkfExu+slpHkBUh95QoiEkqjOTcI8FtaFG6WYmS0KNvfCJWSIoCIBmMuJRYi51jij
 Yz0MvjAn3peIVyuh6v/CDCKjTA0B3x0g0hvu6P6Th0HodnY2mvZMaAvASPhrm5mz86T5
 58+rXY2HwfBDx7TgtBJEB8q3nVKohbFtknhUNZSlpTY4wLOpFGibLcNCUbSOd6r0I/Xw
 Fqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Be3C99dMG8I/iZmt56ebO++H26LE0Tt/O2nc5E40T3o=;
 b=fq4OBdR8kszl0AH3bSdtEZiEohkvtOmQPSNs9B/bt1S+PmXsehi1dET4KliW0WZRSm
 eoIqxPEtAo5ve8fCQy0fsC0Oeky9l83+NlCzUo5NYUJTn4JKCx1uxsUscUg3ACh5VLOt
 3TwYqMaVFSxWgbo0IjFzdW+ZdB0RS4Y5RwvPPnI8lIBM6PK/VUxWqmQAXuNsLdLIHNz/
 8QqDMp8lrCv+kP3CJpWstUmcSXQZBR1E/O/vUAdfMp+5Z58WxrmrTQSTxOT80GPl8MFZ
 RG1LhuC7h3nWDZzEYnMnpCu3Z8jOs/kgqdjGy0CDWKK8uKPuMUsP3xlBNU/VKiHC+yPF
 TSOQ==
X-Gm-Message-State: AJIora/0YSCfs3nG/Oy1Ts/AyZ1kPY1FEVypMLELxNquSD++RnG8Tadj
 vNx1MiHEn+nb0qzrs+MPR5k=
X-Google-Smtp-Source: AGRyM1spEoZ2C94uM38fxaqDejYthsxCoKconaB98Z/hVAvpHq9MkUr4GWQUHm8lZT/gUAygyOvEpQ==
X-Received: by 2002:a17:90b:1e03:b0:1ef:967b:a9ac with SMTP id
 pg3-20020a17090b1e0300b001ef967ba9acmr587396pjb.97.1656967233502; 
 Mon, 04 Jul 2022 13:40:33 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170903019100b00163de9e9342sm22065683plg.17.2022.07.04.13.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:40:33 -0700 (PDT)
Date: Tue, 5 Jul 2022 05:40:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Message-ID: <YsNQP9UJ5faHNguC@antec>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
 <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
 <31017a43-3ebb-0aa3-f6ce-d2df1b5dc177@linaro.org>
 <78ac87ee-e40b-8d18-3775-4417edb74fa3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78ac87ee-e40b-8d18-3775-4417edb74fa3@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Jul 2022 16:48:40 -0400
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
X-List-Received-Date: Mon, 04 Jul 2022 20:40:37 -0000

On Mon, Jul 04, 2022 at 12:23:23PM +0200, Laurent Vivier wrote:
> On 04/07/2022 12:21, Richard Henderson wrote:
> > On 7/4/22 15:46, Laurent Vivier wrote:
> > > On 04/07/2022 11:59, Richard Henderson wrote:
> > > > On 7/4/22 02:58, Stafford Horne wrote:
> > > > > -static const MemoryRegionOps goldfish_rtc_ops = {
> > > > > -    .read = goldfish_rtc_read,
> > > > > -    .write = goldfish_rtc_write,
> > > > > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > > > > -    .valid = {
> > > > > -        .min_access_size = 4,
> > > > > -        .max_access_size = 4
> > > > > -    }
> > > > > +static const MemoryRegionOps goldfish_rtc_ops[3] = {
> > > > > +    [DEVICE_NATIVE_ENDIAN] = {
> > > > > +        .read = goldfish_rtc_read,
> > > > > +        .write = goldfish_rtc_write,
> > > > > +        .endianness = DEVICE_NATIVE_ENDIAN,
> > > > > +        .valid = {
> > > > > +            .min_access_size = 4,
> > > > > +            .max_access_size = 4
> > > > > +        }
> > > > > +    },
> > > > > +    [DEVICE_LITTLE_ENDIAN] = {
> > > > > +        .read = goldfish_rtc_read,
> > > > > +        .write = goldfish_rtc_write,
> > > > > +        .endianness = DEVICE_LITTLE_ENDIAN,
> > > > > +        .valid = {
> > > > > +            .min_access_size = 4,
> > > > > +            .max_access_size = 4
> > > > > +        }
> > > > > +    },
> > > > > +    [DEVICE_BIG_ENDIAN] = {
> > > > > +        .read = goldfish_rtc_read,
> > > > > +        .write = goldfish_rtc_write,
> > > > > +        .endianness = DEVICE_BIG_ENDIAN,
> > > > > +        .valid = {
> > > > > +            .min_access_size = 4,
> > > > > +            .max_access_size = 4
> > > > > +        }
> > > > > +    },
> > > > >   };
> > > > 
> > > > You don't need 3 copies, only big and little.
> > > > 
> > > > > +static Property goldfish_rtc_properties[] = {
> > > > > +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
> > > > > +                      DEVICE_NATIVE_ENDIAN),
> > > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > > +};
> > > > 
> > > > ... and I think the clear desire for default is little-endian. 
> > > > I would make the property be bool, and add a comment that this
> > > > is only for m68k compatibility, so don't use it in new code.
> > > 
> > > m68k doesn't really need this.
> > > 
> > > kernel with the m68k virt machine and goldfish device supports
> > > "native" mode so I think it's not needed to add another layer of
> > > complexity for it.
> > 
> > "Another level"?  I'm talking about removing "native", and only having
> > "big" and "little", which is less complexity.
> 
> "Less complexity" is to keep only native. I'm not against the change, I'm
> just saying it's not needed by m68k.

Hi Laurent,

I would agree if we only had m68k.  But I am making this change so that OpenRISC
(another big-endian architecture) could use this.  In the OpenRISC case we want
to use this as little-endian so no kernel updates would be needed.

So in the end we will have the following qemu platforms:

  riscv{LE}--------------->goldfish_rtc{LE}
  mips-longsoon3{LE}------>goldfish_rtc{LE}
  openrisc{BE}------------>goldfish_rtc{LE} (LE to BE conversion done in driver)
  m68k{BE}---------------->goldfish_rtc{BE} (only big-endian user)

-Stafford

