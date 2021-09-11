Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPBXI-0002Q9-Gh
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 18:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPBXD-0002Of-6e; Sat, 11 Sep 2021 18:31:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPBX9-0007PR-21; Sat, 11 Sep 2021 18:31:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id d21so584966wra.12;
 Sat, 11 Sep 2021 15:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XT2R7gKOwJquO7Q7cTHp+dmuaUe/Pu9W6ODttpllYz4=;
 b=b2bJ2Px663Jyjjkb4rwi1aTGvhuL68k7L2E3bYKODogP2gfA7vnE94/Auh+BX5f7F7
 IxAnhUJZds4iYuJFkhOWmjPofJSvqsbY6WrkuCnbGGERgS7cEZpOTBt8aGtsMphs3VdL
 OX7vLhAYsbzT1EtpdVSRJ+DsVngeojmqXv8cuod8qKxMs0MSJEIaY+EzM+woIw6H4XEE
 lBGZfspthJ6BKFB8kK12vVadMcMIRo8lSQ57dn2P6T17nDCFuA+vhJwv2Mz6IUmkb0Tm
 QO8w2SRNdXbcd+NxpGfvtUBJsh+DJxXGgeo6OTlxBvI3gYTGhzuF6QLiOvSlqJK2+8mh
 HKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XT2R7gKOwJquO7Q7cTHp+dmuaUe/Pu9W6ODttpllYz4=;
 b=I24j3Eo9ACkD9N2mSHal4DSYa8+wi0ow8Zhtk69TEj086l9PfFibuhtR8EWW1nWci7
 0cmEHIB2RgbsnGRj7/ZvxHzWGccG1Taw7xlf4gNgWenqWlpewiH7N2RtIpkLfjzWbxk8
 T/qgMUWY4E82FPALRFYm84womhaNR9eKdscdlChXHl37/8zSsKFtT+hE6mghLbMsu4Mo
 CFnA2Fm7cB9fgae0X+/M4ltFZyBcJrMGDTIObcvYI61yHDcC0FVmgfsjHR5hFdrmDaIx
 B34WgpFi6Ce+yNOlb621y0EwIdsDVCAgh6X/IkCGkl5YKZYj+MP65MJFM7g8ucRI2q7w
 KHWA==
X-Gm-Message-State: AOAM530fK6S6yskBU/LyKMW//zzxkE0TXQ98KYckXAWQ27bfZ3r1IOTg
 evbCWZsX2UtapcKlbG9/sAo=
X-Google-Smtp-Source: ABdhPJwCU/eok/l7PQWSv0uFfyt3OLV/3TdzjV/d32F7wAyFIbNaXVYENwr0FBRMDcjW3s4ZBOaI7w==
X-Received: by 2002:adf:916f:: with SMTP id j102mr4796451wrj.422.1631399495458; 
 Sat, 11 Sep 2021 15:31:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f1sm2689415wri.43.2021.09.11.15.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 15:31:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
 <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
Message-ID: <a49e0100-74d1-2974-990f-a05f9f796cc5@amsat.org>
Date: Sun, 12 Sep 2021 00:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 11 Sep 2021 22:31:43 -0000

On 9/3/21 11:11 PM, Philippe Mathieu-Daudé wrote:
> On 9/3/21 10:42 PM, Richard Henderson wrote:
>> On 9/3/21 2:50 AM, David Gibson wrote:
>>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Each POWER cpu has its own has_work() implementation. Instead of
>>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>>> specific has_work().
>>>
>>> I don't quite see the rationale for introducing a second layer of
>>> indirection here.  What's wrong with switching the base has_work for
>>> each cpu variant?
>>
>> We're moving the hook from CPUState to TCGCPUOps.
>> Phil was trying to avoid creating N versions of
>>
>> static const struct TCGCPUOps ppc_tcg_ops = {
>>     ...
>> };
> 
> Ah yes this is the reason! Too many context switching so
> I forgot about it.
> 
>> A plausible alternative is to remove the const from this struct and
>> modify it, just as we do for CPUState, on the assumption that we cannot
>> mix and match ppc cpu types in any one machine.
> 
> I thought about this case and remembered how it works on the ARM arch,
> i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
> similar PPC machine exists, IMHO we should try to generally allow to
> possibility to experiment machine with different CPUs. Restricting it
> on PPC goes the other way around. Thoughts?

I'm running out of ideas to do avoid the indirection and multiple
copies of TCGCPUOps. I'm not giving up, I suppose I'm simply not
seeing it... David, any suggestions?

