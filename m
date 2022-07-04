Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Szp-0005qT-3s
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 16:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o8SkQ-0006NG-FO; Mon, 04 Jul 2022 16:32:46 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o8SkO-0005ig-P0; Mon, 04 Jul 2022 16:32:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id d5so9330826plo.12;
 Mon, 04 Jul 2022 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nah4inMHP7Jt663zolAnZeMcm+3tMIIpWudIf33/EBE=;
 b=CmyUwRqNJaA5apLApg26JjA6Y7VDllco1ia5ydGeGYQQh7IxC0gJqoTpR9gZNHNjY7
 S1althdiFjK/sgjGCUURKC8gOfQD0GJ7rqljwlFk4xSH7gJs0negWgoCevAQpxmUOU2A
 1TrP627QpG2RcClBpyOB+/64UxkDCL9ntntNsxBIjGGUtRbeleHprilDZYC1zTyAfJsx
 Sck5RUP8u3J8m9mLaApAEUrFUFl5fOjZogzcJrI8+kqfBLWyc8vOAlFj29qY8LshNv7V
 Bf0tp4L1STo++s4hWwHAxe0n0l5AQhjK2ADFTHgWPvpZFz8k3CkwwmgdIoBwqx3476SW
 Jyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nah4inMHP7Jt663zolAnZeMcm+3tMIIpWudIf33/EBE=;
 b=gSr9K9NJ/qS1qFVNDteAyJF8i/k6dykDdhkwFymDqcdKf6DJi4ox5PrIh6PwXVNAvS
 Qla/zUEbpbTKLnOasA38VT32Q5D9YCMqvqNYA4PdhzxfY9gww1rz8bYSaLHLAF5Lplhu
 FljzJI4NEu+fueNh71wRmqnYj42YHViqE/SLV67izLvkMqFX5MPHueQCj2noiHv6V8xv
 rb0FuG1DyVR6XACgbetQYhplM09riT4cSy1mDU16Fk4+hPrpGJZDd+SeIVSltJcFOqSf
 82P+ZpKEU3404vqtebHb9CeUUUOUH5rJK1WMhUIp4KODpZ6MIqPB+iFLCrWILs47S9n/
 zLWA==
X-Gm-Message-State: AJIora9nmn00xvYpEh8PTPpiQpEhiaMWCfcLDcsUWvltPEwv5AfuMrWn
 mYtHFQf2TFJKLzY7XJ5/mkY=
X-Google-Smtp-Source: AGRyM1u43xujI+aV4hwz1MPCSz5TcrI1sHpMwoQKZZj5xMLZ2La76gTvZKm6vqj5UWQcGQ3f9lT1fA==
X-Received: by 2002:a17:90b:3842:b0:1ed:16aa:def6 with SMTP id
 nl2-20020a17090b384200b001ed16aadef6mr39974438pjb.130.1656966763303; 
 Mon, 04 Jul 2022 13:32:43 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a17090b050500b001ec85441515sm13011217pjz.24.2022.07.04.13.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:32:42 -0700 (PDT)
Date: Tue, 5 Jul 2022 05:32:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Message-ID: <YsNOaazY3HsxF+hj@antec>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Mon, 04 Jul 2022 20:32:46 -0000

On Mon, Jul 04, 2022 at 03:29:57PM +0530, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
> > -static const MemoryRegionOps goldfish_rtc_ops = {
> > -    .read = goldfish_rtc_read,
> > -    .write = goldfish_rtc_write,
> > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > -    .valid = {
> > -        .min_access_size = 4,
> > -        .max_access_size = 4
> > -    }
> > +static const MemoryRegionOps goldfish_rtc_ops[3] = {
> > +    [DEVICE_NATIVE_ENDIAN] = {
> > +        .read = goldfish_rtc_read,
> > +        .write = goldfish_rtc_write,
> > +        .endianness = DEVICE_NATIVE_ENDIAN,
> > +        .valid = {
> > +            .min_access_size = 4,
> > +            .max_access_size = 4
> > +        }
> > +    },
> > +    [DEVICE_LITTLE_ENDIAN] = {
> > +        .read = goldfish_rtc_read,
> > +        .write = goldfish_rtc_write,
> > +        .endianness = DEVICE_LITTLE_ENDIAN,
> > +        .valid = {
> > +            .min_access_size = 4,
> > +            .max_access_size = 4
> > +        }
> > +    },
> > +    [DEVICE_BIG_ENDIAN] = {
> > +        .read = goldfish_rtc_read,
> > +        .write = goldfish_rtc_write,
> > +        .endianness = DEVICE_BIG_ENDIAN,
> > +        .valid = {
> > +            .min_access_size = 4,
> > +            .max_access_size = 4
> > +        }
> > +    },
> >   };
> 
> You don't need 3 copies, only big and little.
> 
> > +static Property goldfish_rtc_properties[] = {
> > +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
> > +                      DEVICE_NATIVE_ENDIAN),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> 
> ... and I think the clear desire for default is little-endian.  I would make
> the property be bool, and add a comment that this is only for m68k
> compatibility, so don't use it in new code.

Yeah, that makes sense.

-Stafford

