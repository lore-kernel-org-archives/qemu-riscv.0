Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrI7-00063H-F1
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrI6-0005zw-0U
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:55:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54977
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrI3-0007qc-TE
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590090938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc4Xp9iP+y8ib2misl6Q6rQMS1Tn4Or4Kjqx/XnGrz4=;
 b=clHdwUuetl4RqJt0aBdFeuFIyackAB45klWWsTSkU0jCHdHMf1jJkKegx/ekunOx56Duyz
 S6LU1+kNQQqVk4vigRWCPUsNi0mnBsdMydexdn6pYE4C+4d5tuWKnKwlc64vB7QovqkhFz
 csfnaa2Uwmn3bvo23qTG364KX1rpDi8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-WnVuuvVYPIWLUAs_aHHlQg-1; Thu, 21 May 2020 15:55:36 -0400
X-MC-Unique: WnVuuvVYPIWLUAs_aHHlQg-1
Received: by mail-wm1-f71.google.com with SMTP id j132so1524355wma.8
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wc4Xp9iP+y8ib2misl6Q6rQMS1Tn4Or4Kjqx/XnGrz4=;
 b=rIauEcmVKIGfTZa5e67Kqllhd+3iU5W9ufFJvrYzBCht2lV1plPFcnh1ihL688XGRv
 Y3r+bWrcsiH2ORUGHb1DeDl4ig2kzhfe8JeY+ILWD0D9zLnFeHHMJyJcXzFmQ5mPiokd
 pje+cyoClNUkOEGejz+BqYP+IasUocErBEseQ0XjI/BY7T+MudXkTyG2SsfyIMbQ5ku0
 /B9rwqIystbG+tZS9dyi1QNEAnoZqpc2fXqTn2BIz/JYth//393QJCKzBebg2buDC0Mw
 bkyXk+2tmfj1iUYXG4R746sV1Kxelg/1/83/tR+c828drqKS0w1F/TL6ZIgHJmsTvIQj
 VsbA==
X-Gm-Message-State: AOAM531O0KmpA7P3IcS6njJpxy1bRJNqfICdOIKGQytgc+8ctsrxVCPx
 lSrJXfDaC4AGYIKXaDnl1XABAHN8sxviAfuThiMM6VRhd6/sNMEj7yoQLNiUDqsTdX+KpAQpAdH
 7cvUQf/FtH9CMxA8=
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr10217264wmf.186.1590090935426; 
 Thu, 21 May 2020 12:55:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw43/kqG0dsZ4AnRCLKoBgnNvFOF0SLgu16wnIZcENRLS8rbsa4da0XeebevXsV75Alchvrw==
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr10217230wmf.186.1590090935136; 
 Thu, 21 May 2020 12:55:35 -0700 (PDT)
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id l19sm7846585wmj.14.2020.05.21.12.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 12:55:34 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG, 
 and allow to disable it
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-11-philmd@redhat.com>
 <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2810165c-62f9-1cc0-d610-115525d6a06a@redhat.com>
Date: Thu, 21 May 2020 21:55:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 14:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 19:55:42 -0000

On 5/19/20 11:44 PM, Richard Henderson wrote:
> On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
>> +++ b/hw/semihosting/Kconfig
>> @@ -1,3 +1,5 @@
>>   
>> +# default is 'n'
>>   config SEMIHOSTING
>> -       bool
>> +    bool
>> +    depends on TCG
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..3224cac4ad
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,2 @@
>> +config SEMIHOSTING
>> +    default y if TCG
> 
> Do you really have to duplicate the TCG condition?

How so? The semihosting default table is:

       TCG KVM XEN
       y n y n y n
TCG y - - y y y y
     n   - n n n n
KVM y     - - n n
     n         n n
XEN y         - -
     n           -

So checking for TCG is the simpler way.

Maybe I'm not understanding well your question.

The logic is if TCG is selected, SEMIHOSTING is too.


