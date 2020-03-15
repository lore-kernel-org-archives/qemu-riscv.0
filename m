Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZjl-0007DQ-4V
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZji-0007BH-9c
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZjh-0007P1-EK
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:19:50 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZjh-0007N8-8M
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:19:49 -0400
Received: by mail-pg1-x543.google.com with SMTP id a32so7568297pga.4
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rgAzwP1RNdbzF19h1Tajq+qOWbKSzm/2QF2DRk4/VSA=;
 b=HM0vAKACykr+cRWDfm0nJRMCVT/PRe2cnmJKHIYjmgwjXKlFAL3QF/EIrkPE98mKrY
 oNSVVRBtizAqBwSG/1Ov1R3JxP/B9UP5FtPpQc64sDDBZ6Bbu0dcQOQVNuoeGVR819nR
 40R6TIpNaJu35M5EWJZrTGvgGmHzwEJrxHr/riKasCmJ5qN3FLl4VfOeaBzlqCGFoh0R
 S/gutPjWU9tLvTA6wXQdUtkfqlJQa53716Fo1ogQbfna/0ZGhgTL6+5hxjnbtXx8/fRr
 4RbOpykM/Di10FWpb+DVx8cDeyqXv5lKDwTafABSW0j0+qYPUuOOOK2PvnbA45H9gB1t
 BkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rgAzwP1RNdbzF19h1Tajq+qOWbKSzm/2QF2DRk4/VSA=;
 b=PcPIuPju1EE3//cr+Vyh9FxQzG9+UKJXn7kufwT1J+0efpuYeT5U/4ajE8siJEtCX7
 MZquULBH+Cpxsj8VZuqRj9RFFwpQzhbWXuwKiwfn7lEjlq0O+nSopoA8vQy9AgUSaQCv
 taoAyIMZu0Mph0/OkjG5ecVvAbaie19n6cqGhQNymmbbOqrxVMOyL/fUCmnBDaID4rSr
 WOKbRQXorpfOC4AXDtV7M9ZWkctJ6++kNJsSeGSOCJKvSiV6lbfE0jPQdGFdQidE9juv
 3VDKCrfvv+dP9DTbmQRItpkx/NySR4vwpqLrkxSMN8ca36Xdo6BiSvMB6AACsrijsj4q
 /kLA==
X-Gm-Message-State: ANhLgQ1PYVfBoFGBKXlQAjlUog+PU5ccwG4mhGKxk8quoqk0fA1uvTQH
 h5JH0wW89jf+9ZftAze1SOwJkA==
X-Google-Smtp-Source: ADFU+vs6JkeiTZmfEUpTqoxA9cFlC+QBG6k/LOz3q4+6Qo1BH6dI+qUP2CmFNpJGYeSEMpg1XHZQrA==
X-Received: by 2002:a63:7c1d:: with SMTP id x29mr22588491pgc.197.1584303588218; 
 Sun, 15 Mar 2020 13:19:48 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 8sm25288960pfp.67.2020.03.15.13.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:19:47 -0700 (PDT)
Subject: Re: [PATCH 08/14] exec: Assert CPU migration is not used on user-only
 build
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
 <20200313183652.10258-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c61d62a5-ceca-745d-ed60-78719955912a@linaro.org>
Date: Sun, 15 Mar 2020 13:19:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-9-philmd@redhat.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 20:19:51 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

