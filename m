Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFgN9-0000OG-Gl
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iFgN6-0000K2-3a
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 11:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iFgN4-0007Td-GE
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 11:16:55 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iFgN3-0007Rr-LD
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 11:16:53 -0400
Received: by mail-pl1-x641.google.com with SMTP id u12so7155487pls.12
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2019 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=05tls94euaalL4DwohLqpfyv0VHo5flj8PcM2IO60Ik=;
 b=q423oyDiT1KR2aho2xzaMLiIjYNyGqCROKCvVRItQ7JOG4MqK3YU/jUoxyBJp70onE
 k2qvpCR4Kr5saIB4hratTKb26cl9ycVpxQiLpR3lFzSoR0M3hBjN87aev4+jMRtUX86z
 nDtPvAeugJd+7FsL81O+iFXObZHRtrTe3uWW/yXJZ25TQ1k4nWiXSeWs/o1zisoUqhcG
 fZWe18a+jZf+jePdWFaCDpnd0x99WxW59WDgUpWMry6vDbpsaeIflCMY+FeRNIYqPLzw
 3uCvsPY7qiQtt4ygHCjCnzmer8Kx8SZkZQlm/zULkDbc2HNCsokgd+MsPjZZA0jFlYv+
 GXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=05tls94euaalL4DwohLqpfyv0VHo5flj8PcM2IO60Ik=;
 b=Xz7fYyeSWr2G/HlAZvPvRtqmP7LWUu3aOfstr/XdZ2EET2sDkUfLdrM3IJOvvOefsM
 VmACv0+DKXScsy7j7a3PVmv6Ob0qmEp0QgSh+JY26vMmP4nVCTMiDbpOPuUDnoeCCCsm
 ZVBnX3/OoOAS3hl3gEPPtHQXRTqFGHyBukLRMoXJR+JlxDqcffdIjxSYrLVbAGzcmz32
 GW9svoFoqFQ0+1TZxm8QFbai5PddV+yykM/fWSR4AVm5WT2JGjSIFzP+GjTNXGiaLNE2
 3qH6Ikk2gMPiQ0nlDBQhGmgIYrTXIhBbs1BBaN/2U7JgZEB9PygiBx8dHW6ykojR1u7s
 a5Xw==
X-Gm-Message-State: APjAAAVXpI06S/7FsdYeY7F9CyZBo/n1c2HcwsN15XowUE5bL2i1G+yd
 7g3yJD5vPOivJCFNENLVCwemigoC5hk=
X-Google-Smtp-Source: APXvYqyzthjqsqkvxmm+IrtXCYCzcpPeP8xDiW+fZlh1RnHyiaYN8gIuom3PwnMnad2t8X20LSvxxw==
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr4352618pld.128.1570029408349; 
 Wed, 02 Oct 2019 08:16:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s17sm30893669pgg.77.2019.10.02.08.16.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 08:16:47 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
 <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
 <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
 <20191002091037.GB607@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <02ab8cdf-1011-2bbb-c720-731c2b68537e@linaro.org>
Date: Wed, 2 Oct 2019 08:16:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002091037.GB607@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Wed, 02 Oct 2019 15:16:58 -0000

On 10/2/19 2:10 AM, Daniel P. Berrangé wrote:
>> GCC only implements int128_t for 64-bit targets.
> 
> QEMU probes for that during configure  and sets CONFIG_INT128
> 
> If I'm reading correctly include/qemu/int128.h then provides a
> fallback type based on a struct with two int64s.
> 
> This has some inconvenience though as you have to use the the (inline)
> function calls for all the basic operands and will be less efficient
> when using the fallback.
> 
> Presumably this is not viable for TCG ?

A structure (for some ABIs) may be passed and returned by invisible reference.
 It's not impossible (nothing's impossible), but it adds previously unnecessary
complexity to allocate that storage on the jit stack.

Actually manipulating one 128-bit value consumes 4/6 of the i386 registers,
which I can well imagine could wind up causing problems.  Certainly
manipulating two values at once is out of the question.  That's less of a
problem for arm and mips.

Anyway, all of the pain points go away if we assume 64-bit.


r~

