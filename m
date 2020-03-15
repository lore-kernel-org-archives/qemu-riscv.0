Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDa82-0006ef-8z
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa7z-0006cu-FL
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa7y-0006Fc-5S
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:44:55 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37300)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDa7x-0006BT-Rj
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:44:54 -0400
Received: by mail-pf1-x442.google.com with SMTP id 3so858165pff.4
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
 b=f4e+Q/GYztxTGgIohU+ZUpbG193GhozninwhFE/Hc40VgjLMvSeo15v8WMRNnNlC4S
 +b1FCeXlnEDCuJ8rojP+X8t3pfiBjX7xq63zwr7ODcl79f9OTnY7y8k1hFMPxFfe1V3M
 dugq6DzDVAzcmZmTE0ODP7TcQlHFWqZ+KbHB9gaB4pEsU6QIwmT/FqEVFUoiXKXHfmIk
 tsaXYfVinietrGXNfON1bBHM3vs8jsi0cknmH7N3lYzzQLtZyqMOP9krPxsfy3SvCw10
 0xug7l7iRtjZfHgo0dqYpFFt1Kptlu6P2rIk+SiHLzJVQV65qmtX9eKlGNWkGOLTL9zK
 c39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
 b=hv+nogCXnffon6QYqoQ5xhSo/aihTE9x8AbV4XMOnhs6CNLpUkXajdEPI0PNZfRa2U
 Ia+NowBAUtaXRoNw8Nk0YVKiJkz+rzg4VW6kReEOF0A9RukzPeejlMj4799DDTujGxd8
 AUPYVgJ3vv2vfdsDTCnv4DV5vtDG/phidXPFeC9qbuD8/9mkCq26OlWHodSsct3AnxjC
 dbxhac22RCMsTtAaVRArMg7SsSrFUgfjkc/CwJQGVy2TcFqvDqWCcjxgqe4pWprweIgb
 lEnKLZpzaFE3AfBdfI9SpO/B/S57EYnM7BdGtNT6uBgtymys1EvCfy0OSlChht4VQhtW
 aBRQ==
X-Gm-Message-State: ANhLgQ03kJsVGYs0K9OroxruwWbLq5GImdlND1r3YAPeoXJcHL64kzjU
 Y/uhXRhFtiE7yw4MInlGsXqJbQ==
X-Google-Smtp-Source: ADFU+vvtP3uW9LKERfhJChn5oNpU3hlqP9xmv+mLkTuDEmTJ8JQvz1UJ+xgk3zuIfDnKafJD16j6bA==
X-Received: by 2002:a62:d144:: with SMTP id t4mr11916177pfl.10.1584305092408; 
 Sun, 15 Mar 2020 13:44:52 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y143sm15475592pfb.22.2020.03.15.13.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:44:50 -0700 (PDT)
Subject: Re: [PATCH 11/14] target: Restrict write_elfXX_note() handlers to
 system-mode
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
 <20200313183652.10258-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded109e8-ceab-752d-c938-66d5386c57b1@linaro.org>
Date: Sun, 15 Mar 2020 13:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Sun, 15 Mar 2020 20:44:57 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.h                | 10 +++++-----
>  target/i386/cpu.h               | 18 +++++++++---------
>  target/ppc/cpu.h                |  2 --
>  target/s390x/internal.h         |  3 ++-
>  target/ppc/translate_init.inc.c |  2 --
>  5 files changed, 16 insertions(+), 19 deletions(-)

Hmm.  Or an suggestion to generate guest core files for user-mode upon a fatal
guest signal?


r~

