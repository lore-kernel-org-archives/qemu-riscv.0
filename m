Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG0x-0007Jj-B6
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG0t-0007Dv-2k
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:42:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG0o-0001nY-Vg
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:42:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so353579wme.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
 b=cu2bS4up1KUaZFvfqZzOd2qoAgEXmB9czyJg7Ld9C9RhrRFPlF7SwFqEwPUxttKJHP
 I1xS+ex3bHbMetfNUUCLVWvrfESiUFlOEywVjEsNBviabapOnUNOdhvyN9zKTl2NKPkI
 oFLzpz1YOXk4f6pHR/sY67Y1o2wn+XVbP1qwIi2sdi5BDgf0tM7J6FGdCmto3LcLIaIX
 PKJGhIKO37mpf5Ce+QN4EnowFcFFR+4AUTl4t3FVeWIkVZSObVUv39QZ23RCI1PJPmoc
 scHBKkHA2wztn0q+7QOHwGhnRETaGgrejgdp9/upgRUBCHz7lFrOigJB0pB0zh/LJOTn
 XY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
 b=Wz+CgmTTGgn3zcIi9k77mbTvPJw2VcTPoWnEp/w8oMrnpHC7Pv6dcpJiQHh3OqSNv7
 cTftzG2gMHwi5tHn3coy2TMjvnAjMlj2KWeCImaenXq3jSDiJuIOQRbQ1JfJjNud455K
 fYS/XXuKuMSCvzy1m1pTS1rBQwreH3gqMDlSSRRP7i4rwRjV4eiXN4KGWruVqwJ7E5r3
 32HPtXVmuH2OdUh3UGEUEuFQWOJKWvdMIhsq8aQwLX50+dztpA1eKcDGbrqdIhWN+DFG
 f7c9+cKmHVDL1c1jPd7/SXx7iL3jcXRdLrkJs3EN3dCmadPlpkA1LWBXg8WVk+UPWLqY
 2yew==
X-Gm-Message-State: AOAM533oh6yMMgaiFnpBKhd7k0pxNv8nMv8j8+d6mcXP5Yq+Trgeodp1
 knXCyGpsSsNMNtnTmGKzoQ0J3A==
X-Google-Smtp-Source: ABdhPJwceVbbv7hWOXS37awGetSIGUJik1eFEfP7Dd+3VwgeGBrwgNpP3UDG2KidWTsBePHMk6Y+ng==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr522391wmp.165.1630701729599; 
 Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y15sm462739wmi.18.2021.09.03.13.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 haxm-team@intel.com, Kamil Rytarowski <kamil@netbsd.org>,
 qemu-ppc@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Date: Fri, 3 Sep 2021 22:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTFxZb1Vg5pWVW9p@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 20:42:17 -0000

On 9/3/21 2:50 AM, David Gibson wrote:
> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>> Each POWER cpu has its own has_work() implementation. Instead of
>> overloading CPUClass on each PowerPCCPUClass init, register the
>> generic ppc_cpu_has_work() handler, and have it call the POWER
>> specific has_work().
> 
> I don't quite see the rationale for introducing a second layer of
> indirection here.  What's wrong with switching the base has_work for
> each cpu variant?

We're moving the hook from CPUState to TCGCPUOps.
Phil was trying to avoid creating N versions of

static const struct TCGCPUOps ppc_tcg_ops = {
     ...
};

A plausible alternative is to remove the const from this struct and modify it, just as we 
do for CPUState, on the assumption that we cannot mix and match ppc cpu types in any one 
machine.


r~

