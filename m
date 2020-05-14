Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZI0w-0003aU-2a
	for mharc-qemu-riscv@gnu.org; Thu, 14 May 2020 13:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZI0u-0003Zp-Lv
 for qemu-riscv@nongnu.org; Thu, 14 May 2020 13:51:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56785
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZI0u-0003V2-0j
 for qemu-riscv@nongnu.org; Thu, 14 May 2020 13:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589478679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa20nHTJDbAydpwpo44PiiSeQuV5VNwv6uBL6FlPDhc=;
 b=cFRbxZ9Z0RWEE0uomucvkH5qdl3nVKp59cKN6F4b2AkW+DWOC9J1I5ovRiyikjX9/zxzK7
 F+XKdrHFn+Kh/toBkxnTzHk2FNSMbZgMeY1KLKw3IgCr7ErRhA5bSyNq8bvdq6QXtjnO/3
 0y5Hqz7JdS4tgLPoQYm1Wc/dBj6jYNw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-wB91ETI8Mb2OZ-AnICoSOw-1; Thu, 14 May 2020 13:51:17 -0400
X-MC-Unique: wB91ETI8Mb2OZ-AnICoSOw-1
Received: by mail-wr1-f72.google.com with SMTP id r7so1930222wrc.13
 for <qemu-riscv@nongnu.org>; Thu, 14 May 2020 10:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qa20nHTJDbAydpwpo44PiiSeQuV5VNwv6uBL6FlPDhc=;
 b=V/pnfZcd88YQESsXmPRnL2QSD82671YVyRn4ZhetzA/Zl03z7RdlCW96Qy3qX8AviY
 r4k7NUnLR2dkjVX8QI8S1Gmnbfs6WZXHfByEVj4chrrz8XdDoSoth6tRG4UyZLO4aILt
 l/1JLQeM2MAtNXLdfY8GzOD4ZTFr2znJmvSW69oBT1RTFmeu+LT0X6zk29XsWR7QPvZV
 QldDRD2+RucTmcntjnwoPPJATHN/q57xamiV58RadefGSwA9vIlkRFqFRFwmhoJIZ62A
 322VXzQu3ITRNSrKiz9ihw1djrbq7nsAbhTkugXADJ6j6QGMjEbQFaomny+i9TosBsPY
 x47w==
X-Gm-Message-State: AGi0PuZJ6wkJrdRCr2/QW7jTg5ldKQimCzJv3V+YusEIaqTnfRNnM5qd
 IP2OOVT6rzyXuM5v6PP7XyTpaqCgt3N1M4ghVPN5imqm6ka+F9zVNWn1S16rks64J5R8S97V4dN
 xmfFYK+XEPHKsIt8=
X-Received: by 2002:a1c:bbc5:: with SMTP id
 l188mr29079700wmf.163.1589478673626; 
 Thu, 14 May 2020 10:51:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypJozDXVExZJuu49wNv3EcmH+TwsLU9aIQ1Y+5sQbbc7ak/zOKmmqpW1NWH7beQtyiXm+8ULfw==
X-Received: by 2002:a1c:bbc5:: with SMTP id
 l188mr29079689wmf.163.1589478673430; 
 Thu, 14 May 2020 10:51:13 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id w82sm12660026wmg.28.2020.05.14.10.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 10:51:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] riscv/boot: Add a missing header include
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <dc10c6b220154fd448630ef7a790e5d7e59ab45a.1588878756.git.alistair.francis@wdc.com>
 <CAEUhbmVMu4hov1WxafL9+8kET_Q_Q2hMi8JTnbKE78EhU4kaHQ@mail.gmail.com>
 <CAKmqyKP6khvkjPbYuth3cXgyS6Zed8S29tfwW1Yv_x1MmxG4sw@mail.gmail.com>
 <CAEUhbmWoT0oBszNsY7mPHD+nkY0pOXwN-M0q-AZS45_6p5vG4Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81488a39-a2b0-b9c7-59a6-233052aaa4f6@redhat.com>
Date: Thu, 14 May 2020 19:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWoT0oBszNsY7mPHD+nkY0pOXwN-M0q-AZS45_6p5vG4Q@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:31:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 14 May 2020 17:51:20 -0000

On 5/14/20 5:46 PM, Bin Meng wrote:
> On Thu, May 14, 2020 at 11:38 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Thu, May 14, 2020 at 8:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Fri, May 8, 2020 at 3:24 AM Alistair Francis
>>> <alistair.francis@wdc.com> wrote:
>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>   include/hw/riscv/boot.h | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>>>> index 474a940ad5..9daa98da08 100644
>>>> --- a/include/hw/riscv/boot.h
>>>> +++ b/include/hw/riscv/boot.h
>>>> @@ -21,6 +21,7 @@
>>>>   #define RISCV_BOOT_H
>>>>
>>>>   #include "exec/cpu-defs.h"
>>>> +#include "hw/loader.h"
>>>
>>> Why is this needed? Currently this does not break build.
>>
>> Currently every c file that includes boot.h also includes loader.h
>> before it. Which is why the build works fine. We should be able to
>> include just boot.h though so this is a small fixup to allow that.
>>
> 
> I wonder if this is a required convention to make the header file
> self-contained? The only thing that is offending seems to be the
> symbol_fn_t typedef.

Indeed the use of the symbol_fn_t typedef justifies including its 
declaration :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Regards,
> Bin
> 


