Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMGTc-00076Y-1R
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 17:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMGTZ-00073K-AM; Fri, 03 Sep 2021 17:11:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMGTX-0001HF-Rk; Fri, 03 Sep 2021 17:11:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id v10so478541wrd.4;
 Fri, 03 Sep 2021 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
 b=XH5LRShQJoZBhky3eh03Pmb9SkQ32XBteRsyogRiPstHFr6orcBCJeqTh6+8uA9Ugj
 hwUHRkbv3Iki29kH6SULZWWaPVeHLm9dOZGMJp/KvL+iV9qeA3IsgO7aPDi6dPOxdM5Q
 ws2BSkCdqzZ3QGSkRU4XFRPZC9C8RO5eAPwO0xHZyZ51hswyi5ZlgnIK0hazE40GI5Vy
 pDzx5Z2/NQxO+YOF01K7Wot3MRs8tFcfTdIvEFWt3PL9aHwjDLKgNplb2i8xQwHyzDKi
 JVFun0OPCzM5tItFSKRVH8Yfw5eizrEfOkYRFD8WnJK9txMG72i4kstdXmKL8/qxt3TH
 7oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
 b=XlO3peKDid1vlmXfuRa9KetV1SNMO+h7r1m+fAkfEkSfKYGe3wSBTxdsaR15kf4vIE
 pitw4JBbz3+B4bJI33kMlfJpXvB/GRig3/0my/ECx/SZqogXcrHeO2gXgfwNfpPZhqDm
 ph+fMObv4c9nbLMheofirKp/LYOnIu2ezfwZs9WlsMmMOrPP9gdR3vyHb6CGGhPFZLcD
 qNYARATaDzdHZuAvenZb54aqRh6dj95BGSm6iZ59nuzz44l5z96xFrpuftdWlXqPp4zf
 mR2Fs1yV82YIP5FuwyHwiUbQKrxOW4Bh5DeqXFwQzAm5jKVOyciwby86DtDI0TIBDOoG
 5/PQ==
X-Gm-Message-State: AOAM530WORmLJD0kM+cn6RFXcmQheSwXHYKpVlCFfdYiXvyGogVSQkvU
 8TjK/7SpOxWtrYEeVLaWqfI=
X-Google-Smtp-Source: ABdhPJx9z+1i4IwrqpeoM/m67lAEAeVLF6XhWOMCvs9W+7ge742xu6/mLFLJYvAuNvjtGUuedCA5Yg==
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr974069wrq.47.1630703509319;
 Fri, 03 Sep 2021 14:11:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s205sm411532wme.4.2021.09.03.14.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:11:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
Date: Fri, 3 Sep 2021 23:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 21:11:53 -0000

On 9/3/21 10:42 PM, Richard Henderson wrote:
> On 9/3/21 2:50 AM, David Gibson wrote:
>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>> Each POWER cpu has its own has_work() implementation. Instead of
>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>> specific has_work().
>>
>> I don't quite see the rationale for introducing a second layer of
>> indirection here.  What's wrong with switching the base has_work for
>> each cpu variant?
> 
> We're moving the hook from CPUState to TCGCPUOps.
> Phil was trying to avoid creating N versions of
> 
> static const struct TCGCPUOps ppc_tcg_ops = {
>     ...
> };

Ah yes this is the reason! Too many context switching so
I forgot about it.

> A plausible alternative is to remove the const from this struct and
> modify it, just as we do for CPUState, on the assumption that we cannot
> mix and match ppc cpu types in any one machine.

I thought about this case and remembered how it works on the ARM arch,
i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
similar PPC machine exists, IMHO we should try to generally allow to
possibility to experiment machine with different CPUs. Restricting it
on PPC goes the other way around. Thoughts?

