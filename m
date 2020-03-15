Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZiN-0006V6-5B
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZiK-0006TA-GG
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:18:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZiJ-0001m4-Ht
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:18:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZiJ-0001h2-AN
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:18:23 -0400
Received: by mail-pl1-x642.google.com with SMTP id g6so6953940plt.2
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUbgdJ8axJNBUNavUWRYwmcrmlXlzsQv8v+AhElMzek=;
 b=RucN+341Pl+98/KvSN2eY+qezA3vEcRqE3AjB/4Rf63S2hr0bM1rExlB/XwbFI90Me
 PLuAgBlYSqSlG+txsaNPVK3kQ2llL7+IN5V4DZmAaK+zMxftjvQnJW4pp0rHOingxnrg
 xMkbNgie2vhRQz5iSBV7JWSnzmifnS2fK5fV9olR3ZFWtsd+4ROSnoA6jAIiBaas7gUN
 PcNI3b9bk02PC94xkf35OjROnsQfuy8lVvjn3IRml69T3pk+ROUV7G67+4leH/IEnfHY
 wlKay4tNAuAXWtw0EcI/0jkPhih2eba287kF6byYGHOPcwqPT8V/51q6/O4mb5ZZmvlu
 pB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUbgdJ8axJNBUNavUWRYwmcrmlXlzsQv8v+AhElMzek=;
 b=NV5kgpPiBDWcm7w+KctpdlDBP74xpGOi4MFY+2vnFVWa/tqGYW/o3nNiVRJBCVek8n
 cIRbHtJf9anQ+7HpbR7WE+bmyn3GgrHb51f72tc0C8H4wlJVgXJKWnwyFGcPDo+UPO0D
 8P6+cr8RplyvGgMwIOrVTBU62LY3PUobJwuZaUK6cZYMLc7+Ye+xz3TJUFXb59gkgX7O
 ziEQd+PW3f+1T5U2oJPQshvyIMGAf3EQMzsy+iwIVWDPjsIbAv5ff+0wI80Bz+wjTNc3
 XLqJQtl6VCjLUdwuVYiqk1dHSLNyQqekLsDiB+WugOHmpt1OjtJ1rMyelp+JAaOysG88
 01zg==
X-Gm-Message-State: ANhLgQ36KrBTbyhQiJOHTKEr/5RaPleGDo1v+et0BSYy58yhYPHj0tty
 X+C4ucrUXt8G+KfDmet4w5b3JQ==
X-Google-Smtp-Source: ADFU+vs/addkmQN34sUVbe/KT4pAtgwLGl2LIxE4JatwXayNepsIoE1ea57z4d0zFfseanAvIUJJ8A==
X-Received: by 2002:a17:90a:e2c4:: with SMTP id
 fr4mr21482382pjb.91.1584303502400; 
 Sun, 15 Mar 2020 13:18:22 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f17sm51074460pge.48.2020.03.15.13.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:18:21 -0700 (PDT)
Subject: Re: [PATCH 06/14] util/Makefile: Reduce the user-mode object list
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
 <20200313183652.10258-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d20dc940-1d2d-eed8-3240-9cf28b55d6a7@linaro.org>
Date: Sun, 15 Mar 2020 13:18:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-7-philmd@redhat.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 20:18:25 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These stubs are not required when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  util/Makefile.objs | 59 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

