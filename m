Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1li0R9-0002RQ-LP
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 15:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1li0R7-0002Qy-Ih; Sat, 15 May 2021 15:58:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1li0R3-0003AN-UU; Sat, 15 May 2021 15:58:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso2974476wmn.3; 
 Sat, 15 May 2021 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jf72rOQAJ1LNqHA18SaTpvIhG/hOPGvITA9o5FVWO9Y=;
 b=Utxqi008x/mlPQIss+PV6Cm03yNkn4CTTBWq8cpJTBYOGCxWGau12kRsLzq3vPoC5Z
 0pn35ztK/24YHI6JHAevNRmVVSZpSHrLzfIMG5USXuUZY/NeCDNEf7aw0lKvU2W+sgaP
 U/yTi272nDe/tRT/819C/7lQ5uReAAM3BjbkArO/++UNyNYN3fs15SJmRCLRMmlaKabC
 PZh8xtzOzqCHkk5sdnL2J8xFWKlJnNYW7FkMVbo7x2OUxeUrqn2cBO+7FVB/sYEFahob
 OosZQWMb63RMtkNhbdZU/XcyUYboH68hHxcR+UT67VEwIr+1+uwn4z02tAaWeYbyis3m
 E1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jf72rOQAJ1LNqHA18SaTpvIhG/hOPGvITA9o5FVWO9Y=;
 b=o4oCQ7hrA9mnx8oprxE8FvKMS62PqrBL80wKfVV5caW1Aw93SH0rxCJ+vxpyuZ/goG
 3zCloIOhfCLtFNcGRqSPcSCKU0KS7TQCXwtCYBk/FcIfL1qbk6MrExdp5k0Q3bc1wx6i
 5Ft2TxT/db6DOwe99doGNr+Ka/tYCijsBuVQPq9s4KYoA5u1F2sV074wg/jEVvnNY9bA
 2RR75KqPPhYtm03xjZgp7sbXVS5Pa0vp0eHJCZizt1GgS/mgH2vYPsjrzB2fC4dnxpxI
 arJI7zuW4jucymLxApQ7M5N4sgYs8IW/zcaGIzWIPocJ/tbhlrkj5FD+EIZBBU/0hG6Y
 PjWw==
X-Gm-Message-State: AOAM532f5mcmnRCrnQTgrZXndCAyZ27FKozG8XPpkxPfa5O0E/3QskNH
 uLedvZJsuKQMrwKd1HdwlI8=
X-Google-Smtp-Source: ABdhPJxMcnhR3F8g+KYd7wEj2u1U+ycQy0XepM8+oyLoMWs6BwAyQOBsvWnn9q19iGiIL8b/CRDaug==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr15710760wmh.102.1621108728022; 
 Sat, 15 May 2021 12:58:48 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b17sm10583871wrt.71.2021.05.15.12.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 12:58:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 ->
 ATI_VGA
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-13-philmd@redhat.com>
 <e164f246-80a6-d65b-3dc-8b9cb16d0e8@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eae396ff-4223-a1c2-d90c-55059a9a86b1@amsat.org>
Date: Sat, 15 May 2021 21:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e164f246-80a6-d65b-3dc-8b9cb16d0e8@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 15 May 2021 19:58:58 -0000

On 5/15/21 9:41 PM, BALATON Zoltan wrote:
> On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> While the ATI VGA device isn't a requisite (no crash without it):
>>
>>  $ qemu-system-ppc -M pegasos2
>>  qemu-system-ppc: standard VGA not available
>>
>> it is useful to have it with the Pegasos2 machine:
>>
>>  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device
>> ati-vga,romfile=
>>  qemu-system-ppc: -device ati-vga,romfile=: 'ati-vga' is not a valid
>> device model name
>>
>> Add it as an implicit Kconfig dependency.
>>
>> Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")
> 
> You can list it as a fix but I regard this more an enhancement or
> amandment to that commit as it was not broken in this regard as the
> commit message above also explains. To me Fixes tag means more that
> something was broken in that commit that this one patches up but I don't
> care much about this tag. It would probably make more sense in your
> other commits fixing missing dependencies (although not clear which
> commit those fix as the missing dependencies were probably also missing
> before the latest clean ups).

OK, I'll reword.

Thanks for reviewing this series!

> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

