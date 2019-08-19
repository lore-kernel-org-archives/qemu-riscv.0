Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzomU-0006Fa-PP
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 17:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzomS-0006EH-87
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 17:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzomR-00072y-97
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 17:01:32 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzomP-000725-RK
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 17:01:31 -0400
Received: by mail-pg1-x541.google.com with SMTP id x15so1880991pgg.8
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2019 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=FxoL/ygNz+Ksftm1RuYm/hG7E+xUwHOeXleAvU5RKlIsyWRQv8RINw3kW0ZJByEwo0
 qguqHCPMGOnOa+JMyt2Xwlv2pqzilmdFTcReSsfN6Ms8DIzBRqW1zByU3jMKV6A8MKUd
 Ey3Co++zv2CtWWhtWKSWRA06PcwxEPwJijUHnQXpmVIriIaWqnF3XwHYCWss8+xa440m
 W+qxDOjbHZpamKwURVa1T4q7BTMqMydWd9i8NzVovYN2blADLG3kJVQBic4LQgyy3vlX
 Z06lyjJsf5W39pmQ8zid0Tq07PX/wgluHJ4U9/nidce7U2v5Uo8AzFvmwrpT/uSsFgmQ
 aH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=pi6yxSXm78+Kj1friecFD1YxTJXSor3ScBm4lEWCOerWPyCqjGhd3XrLnr3woFakI4
 jrzF92lHkTUWeoYVrcnHFHnrbSnVlrL95CXtCHRqaHajhxsX+0CHz+wpi3uDJNmKhTBj
 XayYVdNzMwD2DG3KUqOGWs8kXnNQHJ8XzrmiRyTu2rVJaMZAusn3cdu7qpPVaGBt3GsT
 jRHjpsRqUId0qMKO1soUwfiWLGm0kinzJcQopLYh2RrSglSRlEaHkZi2jzoZS5//TP6N
 pR50HOUJWnW2xTigiaHUvlimkci74wjKO5KPnaj6yvhpuoJmz8ofFodQV4r4Uei9e6tv
 dsQg==
X-Gm-Message-State: APjAAAX8TM3yJx3P0PmMFz5utl0Pic2pJMn9HCBH+yCb3wpQayGS4qT7
 fOaJycsSujU17n0EXJh4yqcH/w==
X-Google-Smtp-Source: APXvYqyxYKmwhkk2+hBSFj74Kf7MG7+XWa94OJ2Sw4xj2uOGNS5PTiiDALcNZLOc7wR94aBemA/2WA==
X-Received: by 2002:a65:6104:: with SMTP id z4mr21186266pgu.27.1566248488612; 
 Mon, 19 Aug 2019 14:01:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id c2sm7562265pjs.13.2019.08.19.14.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 14:01:27 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 philmd@redhat.com, green@moxielogic.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, jasowang@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, lersek@redhat.com, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz,
 marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com,
 david@gibson.dropbear.id.au, xiaoguangrong.eric@gmail.com,
 huth@tuxfamily.org, jcd@tribudubois.net, stefanb@linux.ibm.com
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
 <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b79a173d-a682-21da-6e7f-489ce06c8f7a@linaro.org>
Date: Mon, 19 Aug 2019 14:01:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [qemu-s390x] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
X-List-Received-Date: Mon, 19 Aug 2019 21:01:33 -0000

On 8/19/19 11:29 AM, Paolo Bonzini wrote:
> On 19/08/19 20:28, Paolo Bonzini wrote:
>> On 16/08/19 12:12, Thomas Huth wrote:
>>> This patch is *huge*, more than 800kB. It keeps being stuck in the the
>>> filter of the qemu-s390x list each time you send it. Please:
>>>
>>> 1) Try to break it up in more digestible pieces, e.g. change only one
>>> subsystem at a time (this is also better reviewable by people who are
>>> interested in one area)
>>
>> This is not really possible, since the patch is basically a
>> search-and-replace.  You could perhaps use some magic
>> ("DEVICE_MEMOP_ENDIAN" or something like that) to allow a split, but it
>> would introduce more complication than anything else.
> 
> I'm stupid, at this point of the series it _would_ be possible to split
> the patch by subsystem.  Still not sure it would be actually an advantage.

It might be easier to review if we split by symbol, one rename per patch over
the entire code base.


r~

