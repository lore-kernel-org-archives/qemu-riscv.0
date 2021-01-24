Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3lwQ-0007NY-K6
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 15:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lwP-0007NH-6B; Sun, 24 Jan 2021 15:24:57 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lwN-0003wp-Iy; Sun, 24 Jan 2021 15:24:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m187so8816552wme.2;
 Sun, 24 Jan 2021 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YG/Iz1zX6trktQVpArqMoy/UGi4LcPiXe1wKW29vJPc=;
 b=SZRdX+zCkUuz66U9PwN5Z014W4xvga2L9Uls7GUdbIQslsnyJBiwv3WJ2J2Dc8AgrT
 OL7Mx7hQZUe3i4zw0lZH0NAuFQserpaOQoMSIwq3r3JD74jSn5OhjeNwkh0awIug5XDT
 CvABN3OUBQl/itT+FkB1UtVUu9/AuHTa9KC7ldbJtjA8I3IISrUQWs2TGjHtjoHOGQvm
 y6cAqOLLxC1uUedIe22S4uGQI8pgZMGZB2s+Mqt0IPU1Mb9p/7E+kFlIvTu7IvL4PeO6
 5pq48ozXWK+D5L7/rjLwnPkcQuwkJcL8XDhctODiCUQYBQa8QNRa3+KK9zWa4uoUxxg4
 3inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YG/Iz1zX6trktQVpArqMoy/UGi4LcPiXe1wKW29vJPc=;
 b=IDn9wmP+HTw5qAqGWUcpjczaVvbmSMOpZkJUXhR5Qfa0zS6xS8bHZ1ATPKkbFAANZR
 8o26twVcVkG8bv6T8n+bLi3I6KsGrGppTnPYIk3Z/J918bKl0SPknz0URcry9ANzdJ0x
 Ui/Gi5syJH1vNhysn6CiZZmgyTNzafdNUF+SnL2bztJGebEmWDBCFBTq6yyNwGD6+UUX
 XNhmQzjNBjBtvu9h9uKVEcZn4lg40UDKBPZbCaFkoBeuXe29N9/fQl2yu3eRz0EKgliu
 HPF5WZj1Bq37vmOVZtSThVoL+pvGCqjopvD98roCI1BC1Wyr6J7TgOlX9m1Z27xkseg2
 imaQ==
X-Gm-Message-State: AOAM530w1OckmL/UxytmTSieSRHKXkpyorQhXcjyPhLej4/1MFgqU8ND
 uzUEkDRzt6Twd5YduThT6/o=
X-Google-Smtp-Source: ABdhPJwK1oBwvNN+YyIJLuM7uyHToo8hqq5xICiAGf1w4kakkvXDJRFop83oYpjWqAK8/arsgaiGkg==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3914966wmg.172.1611519893275; 
 Sun, 24 Jan 2021 12:24:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w23sm18382706wmi.13.2021.01.24.12.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 12:24:52 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 06/25] util: Add CRC16 (CCITT) calculation routines
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-7-bmeng.cn@gmail.com>
 <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
 <2927f234-a9d0-8fd8-c99e-b858aed1287c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a87dbd17-b6cb-ae0f-10a8-9617c49a807f@amsat.org>
Date: Sun, 24 Jan 2021 21:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2927f234-a9d0-8fd8-c99e-b858aed1287c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 24 Jan 2021 20:24:57 -0000

On 1/24/21 9:07 PM, Richard Henderson wrote:
> On 1/24/21 8:59 AM, Philippe Mathieu-Daudé wrote:
>> On 1/23/21 11:39 AM, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> Import CRC16 calculation routines from Linux kernel v5.10:
>>>
>>>   include/linux/crc-ccitt.h
>>>   lib/crc-ccitt.c
>>>
>>> to QEMU:
>>>
>>>   include/qemu/crc-ccitt.h
>>>   util/crc-ccitt.c
>>>
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>  include/qemu/crc-ccitt.h |  33 ++++++++++
>>>  util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++
>>>  util/meson.build         |   1 +
>>>  3 files changed, 161 insertions(+)
>>>  create mode 100644 include/qemu/crc-ccitt.h
>>>  create mode 100644 util/crc-ccitt.c
>> ...
>>
>>> diff --git a/util/meson.build b/util/meson.build
>>> index 540a605b78..05a376ae02 100644
>>> --- a/util/meson.build
>>> +++ b/util/meson.build
>>> @@ -29,6 +29,7 @@ util_ss.add(files('qemu-config.c', 'notify.c'))
>>>  util_ss.add(files('qemu-option.c', 'qemu-progress.c'))
>>>  util_ss.add(files('keyval.c'))
>>>  util_ss.add(files('crc32c.c'))
>>> +util_ss.add(files('crc-ccitt.c'))
>>
>> OK but we can restrict this to system-mode emulation, as user-mode
>> and tools don't require it.
> 
> Doesn't this get put in libutil, where it is only pulled from the archive when
> needed?  Also, libutil is built once, not per-target.

Hmm I just sent a pull request with this change squashed in.
Should I cancel it?

My view is we don't install libqemuutil.a anywhere, so why overload
building unused objects when some configuration don't need it?

Some of the configurations I test:
- build tools only
- build linux-user only

dbus.o and yank.o are also restricted to have_system.
various objects are restricted to have_block (which is
have_system or have_tools).

