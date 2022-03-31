Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1na0sG-0004sD-PL
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 15:54:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1na0sF-0004pH-8l
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 15:54:27 -0400
Received: from [2607:f8b0:4864:20::631] (port=37396
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1na0sD-0004oF-Gr
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 15:54:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id e5so552906pls.4
 for <qemu-riscv@nongnu.org>; Thu, 31 Mar 2022 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=FU4YJeOWM6yJOftdRdppJkqAphiFFHBDWUUenEYTDla3AjR/9XyWUZ7NZrML9kP99Z
 rqVOzKX0OfynEviPak2SUeMa0Jxf+lrS9EClU7ZqMwKR3W/DNIVrESqbp+0eIEVkrIBM
 M2axkYIj+R7nx0w3lyY4eEihxCsjEfF2rwwm4ERkBmFL3F2/vYC+dG+rn5028ncqt8cj
 SlsMm9LggdTPgKMEVRPSqQNUJJCSU9RceECfCtuPpey4sagbpN/5/PCyVkitJ13aPlA3
 YdQ3O527QYaVl7OfKeTFGDfExvfTRBdEKXr5OeP9UNh/o1LsqwQB9z32d0VsYvZtWzn+
 VywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=MwM+KvimZUehhSSm8eLmawWem1BsLND+8St6HDSqpHj1EU5eAPLQ9BDs33WmQlUy6l
 1ri1y+ev5Ye0MqPgYlRgTGdDnoggNHdIY4HgMg2N2MzLBww2r3fEttVPjso+5noWvYwf
 OHFoN3iyBaad7z6wH6xKKsO0dwHeRMpBtpgGo+ybqwf6z0EBfX3BbuASmgsbHPTVG+uU
 0oSKY7sqhkWBLxsC6E0086cIbMDl+QPhhiwgEgnfPyBtWz3uTZ6gLAdNGeDmJCMFlsVs
 ekwJEvwItGKV2tpobY3yc8RT1tvQL895kDvY4D6Ut2GWBUSPVJ6XhV0TQgmnrEkUeX8G
 IVbg==
X-Gm-Message-State: AOAM53318V+2CmwWH5JXSof8HTld5FlK19a0TUs4qYrpEqVOC3Kxktiu
 9Q5tCd7fVqX4Y2MKfvUxztV24w==
X-Google-Smtp-Source: ABdhPJw7JKGfhtf3xhglvwKuCf7tiq5byULmqZPX/onK7gDxOwmiShZCnNHHKkZbJwIlhjSsWTfaDg==
X-Received: by 2002:a17:903:32c7:b0:154:4156:f384 with SMTP id
 i7-20020a17090332c700b001544156f384mr6965753plr.34.1648756463019; 
 Thu, 31 Mar 2022 12:54:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056a00114a00b004f784ba5e6asm323970pfm.17.2022.03.31.12.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 12:54:20 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <CAKmqyKMsG6d7jaS2gxXxh+qONWkWGbHFwLK9tYb2q7eeQe77uw@mail.gmail.com>
CC: idan.horowitz@gmail.com, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-beb640a4-0833-45b9-a57d-1e98464152f5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 19:54:27 -0000

On Wed, 30 Mar 2022 22:13:39 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 31, 2022 at 2:36 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
>> > On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>> >>
>> >> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> >
>> >> >
>> >> > Presumably you mean "revert" here?  That might be the right way to go,
>> >> > just to avoid breaking users (even if we fix the kernel bug, it'll take
>> >> > a while to get everyone to update).  That said, this smells like the
>> >> > sort of thing that's going to crop up at arbitrary times in dynamic
>> >> > systems so while a revert looks like it'd work around the boot issue we
>> >> > might be making more headaches for folks down the road.
>> >> >
>> >>
>> >> The opposite in fact, I did not suggest to revert it, but rather undo
>> >> the revert (as Alistair already removed it from the apply-next tree),
>> >> since my original patch fixes buggy behaviour that is blocking the
>> >> testing of some embedded software on QEMU.
>>
>> Ah, sorry -- the QEMU tree I was looking at still had the patch in
>> there, must have just been an old one.
>>
>> > So, this is a little tricky.
>> >
>> > We want to apply the fix, but that will break current users.
>> >
>> > Once the fix is merged into Linux we can apply it here. That should
>> > hopefully be right at the start of the 7.1 QEMU development window,
>> > which should give time for the fix to propagate into stable kernels
>> > and not break too many people by the time QEMU is released.
>>
>> If you think this is a Linux bug then that makes sense, but I think this
>> is a QEMU bug -- I sent a patch, not sure if it went through as it didn't
>> make it to lore.
>
> Ah whoops. I saw the patch but didn't read it, then I assumed it was a
> Linux bug from your diff earlier.

No problem, that was the first thing I sent in the morning so I doubt it 
made any sense.

>
>>
>> I also think the bug will manifest without the TB exit patch, maybe in
>> single-step mode and definately if we happen to exit the TB at that
>> point for other reasons.  Assuming my reasoning is correct in that
>> patch, we may also be hitting this as arbitrary corruption anywhere.
>> I'd started to write up a "QEMU errata" Linux patch for this, but then
>> convinced myself that just adding the sfence.vma was insufficient.
>
> Yeah, looking at it now I agree, I'll send a PR for 7.0.

Thanks!

