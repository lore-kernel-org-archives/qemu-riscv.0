Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpmmq-0007Sw-Td
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 02:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmmo-0007K7-TP; Wed, 24 Nov 2021 02:33:46 -0500
Received: from [2a00:1450:4864:20::331] (port=41754
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmmn-0007lI-8y; Wed, 24 Nov 2021 02:33:46 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so1277844wmb.0; 
 Tue, 23 Nov 2021 23:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TS7LMyK35o1thp0kPBFG4FRYc4y/FXL9a7x1qt5b2hY=;
 b=ACa4+1PnMj7zdUGJh/svDIDI5rUPI/uHLF1O1gRbU25aoz1LHXZYYXtSHQeAfCkapV
 zKYUidZ3O+mNZyF/pFjlJx55XbWhkTG1quKKhAeFsWINK7d6eyWOFzRscvsWPACjrNZT
 jvhTcGltPUZZVql721Sna10OyEpArUD6UuYPOwBP3b61kFWCNDtmERdk1/+D/AID0bTI
 PONBRikC+Zljs6emWU6fRQJDFswYtF0X9LhfwdpBsXms18gQFJpe7k+2nqTU+xl2Rbri
 FiAN0C6VUpzjwmXisWJgrQhG24Nx7EFGYToEowP0ibvtX9vVWVX2STSN6FMZ18Cdh6uG
 lz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TS7LMyK35o1thp0kPBFG4FRYc4y/FXL9a7x1qt5b2hY=;
 b=N6cYtCnSF/+u4/330gMenDcY061zPZ7WzNlYnjz8PpYARwuayYq29XQNhHwlkU3u5Y
 nz+Ms77ITGhGfNB6gzSw2NRX2FlvJ1KEAWrucPj472ofDBxkt3YzCz0a2Hh9wqJ/wo0H
 3nj/SRogZLD8JQoQDvST7pa+yRQOYCMYgWP5xqclHu19BhCaP3C5+xRE0IyOXBHbsjY4
 tCpxX2bG5NSH6yREVMoQ39fHNhvU6hGzWxL72QXOQDSVIpp+iaW4fgg86p+9vPlCVX6r
 3TpSDEsrZ6DpaT/EWKQ1m9ZATKKQCbTMStqC5tOXspO8H85qWzbAajmqKHJB4TQMzd9V
 3skA==
X-Gm-Message-State: AOAM530muyQVSOOfmK09eNWzGcwBW4uy3KPnJNUi6b5t5qJm8YEPrf1u
 iKpRmllXTGoSS4MX0HiGbSo=
X-Google-Smtp-Source: ABdhPJwsIj9jPS4AOVpRZ606ch20tq17HtcCJAhyxEQtBQ6Wo6Ji1A1bMaRMvTJUBjvb7qAjUN4YiA==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr12247739wms.175.1637739222380; 
 Tue, 23 Nov 2021 23:33:42 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g13sm3690594wmk.37.2021.11.23.23.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:33:41 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <88c5fc89-49a3-0dd3-87bb-287ba590f915@amsat.org>
Date: Wed, 24 Nov 2021 08:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 07/18] target/riscv: setup everything so that
 riscv128-softmmu compiles
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>,
 Alistair Francis <alistair23@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-8-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKM_6QH40iesGaCYLxWHzRyfoFACEH+eiOY-_YQTpeo=nw@mail.gmail.com>
 <a68d73ec-bde8-5869-842f-e45bbdbdc5ed@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a68d73ec-bde8-5869-842f-e45bbdbdc5ed@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Nov 2021 07:33:47 -0000

Hi Frédéric,

On 11/24/21 07:55, Frédéric Pétrot wrote:
> On 24/11/2021 07:12, Alistair Francis wrote:
>> On Sat, Nov 13, 2021 at 1:16 AM Frédéric Pétrot
>> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>>
>>> This patch is kind of a mess because several files have to be slightly
>>> modified to allow for a new target. In the current status, we have done
>>> our best to have RV64 and RV128 under the same RV64 umbrella, but there
>>> is still work to do to have a single executable for both.
>>> In particular, we have no atomic accesses for aligned 128-bit addresses.
>>>
>>> Once this patch applied, adding risc128-sofmmu to --target-list produces
>>> a (no so useful yet) executable.
>>
>> I can't remember if we discussed this before, but do we need the
>> riscv128-sofmmu executable? Can we instead just use a riscv64-sofmmu
>> executable?
> 
>   Hello Alistair,
>   Richard was also advocating for a single executable, but pointed out that
>   we need to disable mttcg because there is a need for specific tcg
> support for
>   128-bit aligned atomics.
>   Given my understanding of that part of QEMU, I choose the easy way to
> disable
>   it once and for all at compile time until we have that.


In rv128_base_cpu_init():

  if (qemu_tcg_mttcg_enabled) {
      /* Missing 128-bit aligned atomics */
      error_report("128-bit RISC-V currently does not work"
                   " with Multi Threaded TCG. Please use:"
                   " -accel tcg,thread=single");
      exit(EXIT_FAILURE);
  }

Regards,

Phil.

