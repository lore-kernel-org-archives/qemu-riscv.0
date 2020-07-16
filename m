Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvyRC-0006hg-Hk
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jul 2020 03:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvyRA-0006ex-OI; Thu, 16 Jul 2020 03:36:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvyR8-0000QR-Ty; Thu, 16 Jul 2020 03:36:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id f2so5921919wrp.7;
 Thu, 16 Jul 2020 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dyH8o4vzMlymGeUY9+yHBDYe1iWlqFQDVWjwN1WCOXk=;
 b=lIXhiJP9Ma5CAeLTj0X6o0pnZuGcT3tsznlEecmzZHF7TIcI1wOXIQC44BUl3z3kBE
 WymQ1CcbOUmSRT0wuMEGxGiPCY0LANpWX8XMoeRuQuIohwHa1RnxY3jVEIDjK9QfqjRn
 KY8m36mh4KcNlkDqsgFXdd9lJ6nkt3rJipr1h6pcPMzzizn8a92DS42XSm563L0q/bfP
 ujvsWywWPK2/EwZDLS9iXHgCj+EG3mrpFvfIle10a++QqYOfpMkhYYr7JoNaQXgrM0H6
 n6c3vgENwRuRSUi+o5bx3sqWJI9Up/1Qj/2k2x0kPpmRcTxIMwwG/NdsdOBSWfQIWjYW
 Fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dyH8o4vzMlymGeUY9+yHBDYe1iWlqFQDVWjwN1WCOXk=;
 b=IoNGiCZ7uv6jEPtefRkxWm3VVaTNnegbVQvuuAZy+JWsClpvW1D8blckuXletJt9bs
 zGJkz+4V71R/S6x8l1DDh+0Y7IVIbuwa1vjGAUV+crt0GCPvBDcyayALQMmogzs+79rs
 SR+LqKNDQlOnFCO6HmIWy+6PqSnJQmMG3jTiqPSpVk4GpBEmFGAfU3BuSqiuYocra2DV
 vE882XtNTBRk6MXA3ej6JPdiqlVwcQYkuShtiJL/Qve4eQXvYpiKYTIfTVLSjhq7uhpQ
 ihrazg5Lp+2ozwwuPp7IQdrXhCdDrormLA/quPlcMOm7DjHKTs2E2dg9OagfRbZOOUBg
 Xj9Q==
X-Gm-Message-State: AOAM530QUtzKulXs85dg/N2M0hTgjsAC0GG/cCBwbvgZbVvPdkRCnMKD
 OnZAlc2ba+4pVhwprqiNCzE=
X-Google-Smtp-Source: ABdhPJxDZwWd4lO6JOSy6EdZZgYBOKgyW3tnymT98j8XoLXlJNeQwYE+QX1jyZnZqBzBe6VgbWd8VA==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr3880049wrm.92.1594884968593; 
 Thu, 16 Jul 2020 00:36:08 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id v15sm6772250wmh.24.2020.07.16.00.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 00:36:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
To: Thomas Huth <thuth@redhat.com>, sundeep subbaraya
 <sundeep.lkml@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, nieklinnenbank@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, palmer@dabbelt.com
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
 <87wo34u9fv.fsf@dusky.pond.sub.org>
 <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
 <9b3f870c-481f-79f1-e55e-074ee0d95633@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e08aa92-0db0-1a09-0716-5f5ff896910d@amsat.org>
Date: Thu, 16 Jul 2020 09:36:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b3f870c-481f-79f1-e55e-074ee0d95633@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jul 2020 07:36:13 -0000

On 7/16/20 8:07 AM, Thomas Huth wrote:
> On 16/07/2020 04.59, sundeep subbaraya wrote:
>> On Wed, Jul 15, 2020 at 8:12 PM Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> On 7/15/20 4:04 PM, Markus Armbruster wrote:
>>>>> Watch this:
>>>>>
>>>>>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
>>>>>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
>>>>>     {"execute": "qmp_capabilities"}
>>>>>     {"return": {}}
>>>>>     {"execute": "device-list-properties", "arguments": {"typename": "msf2-soc"}}
>>>>>     Unsupported NIC model: ftgmac100
>>>>>     armbru@dusky:~/work/images$ echo $?
>>>>>     1
>>>>>
>>>>> This is what breaks "make check SPEED=slow".
>>>>>
>>>>> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
>>>>> qemu_check_nic_model().  That's wrong.
>>>>>
>>>>> We fixed the exact same bug for device "allwinner-a10" in commit
>>>>> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
>>>>> function".  Fix this instance the same way: move the offending code to
>>>>> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.
>>>>
>>>> That addresses this other thread, right?
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
>>>
>>> Correct!  I wasn't aware of it, thanks for making the connection.
>>>
>>
>> Thanks Markus for the fix.
> 
> It's rather just a work-around that avoids the crash than a real fix. I
> think we can use it for the upcoming 5.1 release, but it would be great
> if you could rework this code for 5.2, so that the nd_table handling is
> moved to msf2-som.c instead.

Yes this is not a 'fix' but rather a kludge.
Thomas gave some tips to work on a fix here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html

Thanks,

Phil.

