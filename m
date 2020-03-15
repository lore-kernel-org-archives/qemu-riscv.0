Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZXx-0002uK-Jw
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZXv-0002t9-1n
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZXt-0002hO-PO
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:07:38 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZXt-0002Xu-Hv
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:07:37 -0400
Received: by mail-pg1-x543.google.com with SMTP id z4so2637166pgu.3
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AfrTK/b6k0acUn4IW674vAyc76w/gBDaEBHOCoRtH74=;
 b=tOe3XXuB2QWgliU9Opdz9RfD1OXqF1tgipkrV9v9NFtP22NecnEdyP3zBsS9dv7uNU
 FmTm2pnPTuXBX8RPsRtlb5hioIrWDoJKfidDtD9sGmit06pNvrEDJ8dBI+mEZte+aZjr
 nN91N+MCX0eJEunBEonVF3g+6a5Ab9JP8NKJuS1Ep0bH0ykLDfXpuCaB1EtuLCIPIJTM
 CLgw8Cky2PK0LYDLxZNSxEP3MqKuVyRMm9tMeMk6JEs/PoJb8TxY8rddHNSsIF4ZrdtX
 V2n5m7Bkp7yocw7uRoYzTIu7RRsmUhh4QkFae6gIs18h55I/9EkMzxjX+3UzLgLzVhdv
 41Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AfrTK/b6k0acUn4IW674vAyc76w/gBDaEBHOCoRtH74=;
 b=hNUcgJICTgvnLMv/vWWXPFFtf+ROn8tDKgvVgmHrlw8UeHC2o9Wc6G8o/q+CLrgwVN
 PepE9vJvBhVmdj800uX8xbpvMJp+IcUeGiC9YsVIAeq3E8Ed07R5c5uZe3aK32a9c8nj
 WUQxiKOEgS8AmzLQEEz2ETeNgp99mkX3FW8SbhdcJLhsrTUaulGthTP3qEM2aAz/nvwd
 yLcfU/FtlZ7J863lDnr8e+fQV3QSbgXGz43e5sNR7Y3C2uVRBCjoAqSu3dkMo/8drC3Z
 hcr+/MY3dtMT934aHSlVrjeoRuHKtuhHVNR/f2/oG0cbNcMrrISsBJDymkyP6Ay/0+Ck
 +NqA==
X-Gm-Message-State: ANhLgQ27rJmZbV/IL7BRo0SavdjYe7frdTOfy0UciCX5sRgeb3JVwVtk
 ja+4Lbth1yp2WJOD83XKhK2mrg==
X-Google-Smtp-Source: ADFU+vsueR85ye3lPcPONMF5ThCBFNP2R9hCqzd2OsZCP01oFAPFIc7A3zZ6pvPCcmNbjyEOYngj0Q==
X-Received: by 2002:a05:6a00:c8:: with SMTP id
 e8mr21563883pfj.131.1584302856321; 
 Sun, 15 Mar 2020 13:07:36 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s25sm4460709pgv.70.2020.03.15.13.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:07:35 -0700 (PDT)
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
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
Date: Sun, 15 Mar 2020 13:07:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Sun, 15 Mar 2020 20:07:40 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These tests fails when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/Makefile.include | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

So... they don't currently fail check-unit.  Did you mean to say that they
*will* fail once other files are disabled?


r~

