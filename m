Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZ7m-0004Pg-Ir
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 15:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZ7j-0004OA-Ir
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 15:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZ7i-0003m9-Cr
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 15:40:35 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39052)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZ7i-0003eN-1i
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 15:40:34 -0400
Received: by mail-pl1-x641.google.com with SMTP id j20so6908553pll.6
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rWBBelztWn3l+5B9ii97cqEND3HA6vz9gtBRsg/4GDk=;
 b=ac2Gpel3xEJzjwabmHZif3J9mt9XgySciaQaRRBNrLq1iaaa3p9AKh5ZySm1pAY+Wp
 7WuKXI64uAFvtSkL5C5WMOU0SXkBEUSSjegxl9b+nKzqmfdNTORVxSH5t0+yjClmSp7W
 Tz2PrmPeQyvdCA36I6k/2Mcx3LO2c3duap5dCHTioRCJ4dKMKAO0p0dS8HHA9UJRElnF
 aT12x/VChm/7HI0GkzHeDaeyw0FiduEbnhJOq+o/FKUyuR//GmSpojfS+nWJPpDspKn8
 QxXseEw2BdchnUilkPznxWU+QuvOiusmC+9reybUUqly+PVtym2oHdmPZHHdTtvSEfdy
 OxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWBBelztWn3l+5B9ii97cqEND3HA6vz9gtBRsg/4GDk=;
 b=i3CHNibnv6FX+5hreS5z88Fo9jXeH8EbQmfHRQZbyINk7+g1lJn5QLRO33TpG/Mqsr
 /1KE1Xd1dgTRHx4TzRZDUQYolRPmUQHWZqcI1RXBz6zmXrWtF9rVYbjs23q7R8WWIHXT
 FKnGrZTzQQy3h3kjsWutHZT4ew+STEjZV0ytTpASNu4eO9Qz+E1aQiumookZQWygTNSN
 FJ5ki+HrpPiFQQFFWkKpG4139e5GGl6XCzMi3v36u+ok+wF1t3DzkVP7fP7WuhXP7ohi
 ZKGI8s+zEDw2tTDNGnXrHwjIjuaOxpUtCRaRzgiGKaw+8tFoHF2vD7NJmaiyfUmcJX65
 cn0A==
X-Gm-Message-State: ANhLgQ2cLdQTl7iWpxZE8gc+MsqwTee08zPETuvlppvg2ibGb8OKZnE1
 2/13t8YTNHwF5nPawRmYYbl4PQ==
X-Google-Smtp-Source: ADFU+vuMK7+04gVLvdHhAT2GvWb0irP3tImbd3yniMzCLD0R01olHGsz5yWjP1wd6/UMp1F5aiO4Dg==
X-Received: by 2002:a17:90a:a385:: with SMTP id
 x5mr22056292pjp.102.1584301232723; 
 Sun, 15 Mar 2020 12:40:32 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 m1sm13078527pjl.38.2020.03.15.12.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 12:40:31 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-2-philmd@redhat.com>
 <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
Date: Sun, 15 Mar 2020 12:40:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 15 Mar 2020 19:40:37 -0000

On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>  ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>> -HELPERS-y += virtiofsd$(EXESUF)
>> -vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
>> +HELPERS-$(CONFIG_SOFTMMU) += virtiofsd$(EXESUF)
>> +vhost-user-json-$(CONFIG_SOFTMMU) += tools/virtiofsd/50-qemu-virtiofsd.json
...
> 
> Why don't you do that instead?
> 
>   ifeq
> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)

Seconded.

r~

