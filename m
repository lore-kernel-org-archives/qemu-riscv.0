Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDa4c-00055L-Uu
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa4a-00054C-6H
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa4Z-0004BG-2c
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:41:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDa4Y-00045j-RC
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:41:22 -0400
Received: by mail-pl1-x642.google.com with SMTP id g2so4461171plo.3
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ptWp7DiJgrQmGpFT+cURd2sayWW2ITlf8l13syF2CGc=;
 b=n8vZi3qH28OwzWiE8KfIc9it3IHgWAxBcK7e2tNBJxkX75+SoaJvHDljDff/UenDo/
 m9oolZXvZfgHYNBtVUmMef6F9arSacrn9QJPuS09zf9zQGVpd1OJyHRG0IA9+hv2YZAA
 WmpKJTxN000P4Dxuc4iTDehOXcbq8UOZCw6ZGHTb3Jx/6EBg4INkIf+0aTneZvSA25mh
 Qw2oCxi/lNq4oHX5ZTh+oZmu63M9mkXvnHW4VnXyvud/OqIfMrCl46yp65zzHGRBmcng
 Yp0o7IVRpDPL9eWJQNYW4VCQQNzTqWywou9jv+XR1ylAlBsqFuHRKi43uEsZN78salYL
 9rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ptWp7DiJgrQmGpFT+cURd2sayWW2ITlf8l13syF2CGc=;
 b=VtrpDdiIiDNvvvTf4uUwQpSUdLrrfV6yW7ydpz0rsLDSC1mbtAstTI4Tb7MWZGPqCt
 do1yMPvhgfNlAc/0zVQRtwHltdupcqRFuQoZPGn1WcaR6u5XQCNx59eI/e2bwTSu27VJ
 P/YFxO0ar3x9SytPHcf2YAPUteMywJgEPsyUnb6rbVP2BUamIUqMTvqRKP5fW60U+Guy
 gikgEKApVbUsUMqTWqhnnefqE22YyKB4uO8LFjo7IWGKjUwxiUAuSBD1TJz1wElS9rJL
 WX296OFk6kEBjj87Z+7Ln+P5DIxeUTRJi5RVt85oBqD1IlXfixyB3spe7CzvJIRd403W
 897Q==
X-Gm-Message-State: ANhLgQ3oQwE6qhWYsMwB1VcOq0J457SLI4dmBfBK+d1WYeFVtzxBg+KZ
 RtBXR2mr7lVjVdtgDCEOhH8m3A==
X-Google-Smtp-Source: ADFU+vse27WxJ2ELddAnrCxJTG3eOKRMRKL1GYKnUYoEFJco84s7vgy56r/l5kZbHu0FK6EzKNb8uA==
X-Received: by 2002:a17:90b:1a89:: with SMTP id
 ng9mr20994362pjb.102.1584304881822; 
 Sun, 15 Mar 2020 13:41:21 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z15sm29706547pfg.152.2020.03.15.13.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:41:21 -0700 (PDT)
Subject: Re: [PATCH 10/14] arch_init: Remove unused 'qapi-commands-misc.h'
 include
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
 <20200313183652.10258-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48b4eacf-e95c-ce1c-e198-c1c9c96b9f33@linaro.org>
Date: Sun, 15 Mar 2020 13:41:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Sun, 15 Mar 2020 20:41:25 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
> this include.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  arch_init.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


