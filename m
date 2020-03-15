Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZhZ-0006EB-00
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZhW-0006Dg-OI
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZhV-00078Q-EI
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:17:34 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZhV-00074C-4m
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:17:33 -0400
Received: by mail-pf1-x441.google.com with SMTP id x2so8312761pfn.9
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6gBwYbnX4Se3M5jfu273nxf9h2vGvRVO0RidTPNXEr0=;
 b=I2E/3N9J5wVSHrrdGxlRtlqdy44+ZlhOHgN+wGslHxCr4+W4xiZXj3udZ9D31Ngjrh
 6bf7CI/CGckIWfC9F275EZmzIUTu8A4aI9LlZ4C7x1dE2JZwoAmcTYdd6Vg5jotCdc0s
 C/kwHfrhB9bQFtpVkn2D+qhni7El9685nay2zcGm26kVArIv7D1skBA+8IRfZK28eOGZ
 zpVmVCb1NulH/axIWqoo6rMNnAB7LNBtEuDDJikFrbdmOTHc1X0pxcIygQVYiD2Bzi1L
 8H7dPKDWQCr/PiSIEgJHsG6WNjo315uZp8GRPCjUlPFBdSDGpry0AaGEMAgUBNQKCy9Q
 IDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6gBwYbnX4Se3M5jfu273nxf9h2vGvRVO0RidTPNXEr0=;
 b=sSsYM6MY0MmBcSII7rJ1VgHNHHQnhydwGyi2FrC3PFTOCbmwmoo1uDGvOTA9+Ci7Ke
 9m8BZmk0IF0O+e8pmgm+nl9WnKmcCSjJHTAyy7s5p2MlGgEDv8XmtnqxybYtuhiIicFO
 ydan02SiX6w+xwovnBFWrHhEbuyidLqUJ2j3kr6FbdFCCdTuw5RDA+DuSnR/M4IoIaTY
 v7N6ecVKLRMC3dHHDcdq/0PFVwVEsM4V8fQNAyX/gsT84cP7hLuYo9EPY6iIuaPnkZwH
 UdgG4PE/IFoYDzAwR5JY29VMVrs0ScZmhgmtg8HEmfUAqqQRhGvDe2WmUmWAUZcWsdCB
 kfDQ==
X-Gm-Message-State: ANhLgQ1+1WjzDx3gfxfX+hyGL6bZU/K6efTbVjkgeQG2lXdjRaPuoUZZ
 tNrJSAQo4MYW2yVtitrIknKC3w==
X-Google-Smtp-Source: ADFU+vssijLhaXyL/4k+UfHIYKXFWUVTPyO2a4DXoxZAIug2ken6y9Qn0xE5K7nlggctqPlVJ4SzVg==
X-Received: by 2002:a63:ee02:: with SMTP id e2mr22989077pgi.183.1584303451954; 
 Sun, 15 Mar 2020 13:17:31 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f127sm65685327pfa.112.2020.03.15.13.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:17:31 -0700 (PDT)
Subject: Re: [PATCH 04/14] tests/Makefile: Restrict some softmmu-only tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-5-philmd@redhat.com>
 <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab32ab13-f5ce-8f6d-af9e-d59272801c3d@linaro.org>
Date: Sun, 15 Mar 2020 13:17:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sun, 15 Mar 2020 20:17:36 -0000

On 3/15/20 1:07 PM, Richard Henderson wrote:
> On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
>> These tests fails when configured with --disable-system.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/Makefile.include | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> So... they don't currently fail check-unit.  Did you mean to say that they
> *will* fail once other files are disabled?

Ah yes.  I've rebased your patchset without this one and it does fail.  So with
a re-worded commit message,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~


