Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFhE-0005mt-Kw
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFhD-0005jx-1Z
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:21:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFh7-0001tD-L8
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:21:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so326969wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
 b=GhgL9+LGgM+gjslEr/EdoI7/xsxfmmw67TehO/6U7pPlE/OPtA9LjE4SDDmXvYLAmN
 yZeX0gl3cDixUofaJ53d7PYirmx3VephL7Fp2AHgbYGFY+2vJtFBsCzJiTNZI+nj8zOU
 lX3C3n2CsiqPN2JfeGez5wPcTov60f+AYR19eDiQGHsrHnbpM5alfslIIIHhsT0nTxma
 DXlSCsL0edylOOeUn7jofbIz89KxP2tF8ZT5uMLxWfF0tNPmLeVePpEpIaz8SindXxiw
 pPRklR9Iklk2ipRx/ia9X3h7Q3ffP7aRj506nP6FYfGI6tshEguc/NBqS4OKI2Ci9Ann
 FGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
 b=F1vA9Vby9utubWMg49mOvfvesJ19/XnqBoa8BFfRp6AYhIuJ3hQwqGyYsPWim456ra
 MLVhIaywwEMCEfZyYPozW7YIQVt4WZl8M70a8oStY457wpMzE1PXJXgqId7Js34w34iE
 ecryrQwF8G61Ioq0YqcG+hZKKBYjtqyE6up+7FsJBPE+G5Pz8MMi51UOcfg0x/fUc8r8
 b7pZleVRpxNMShEtkj5rtoJrAvpeBXsDzXZZR/C8xfZbW0kz6VOl9qcTXy1PSUV3x7T0
 I/tV5K3Tv5V18hkbIPrXjjyrWV8sshQbZuNd6GSsNYfYSnOXoC9u+5ahhhoMAb8HSmx0
 EJcQ==
X-Gm-Message-State: AOAM533K4Pkp8D34pYmJewjbxc92M2uNZ0Q+oDgTsb9iKXATxdY6r1wE
 IZ57beVTy+f/AK64CxHlS4K+HA==
X-Google-Smtp-Source: ABdhPJwPe1mnKhrxerAyhvhbZ2seI44kln/Bm0nN+tszrWb4ThZb+maUMAoke8HDY1589uhlj92r0g==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr768062wra.439.1630700508096;
 Fri, 03 Sep 2021 13:21:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r15sm402884wmh.27.2021.09.03.13.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:47 -0700 (PDT)
Subject: Re: [PATCH v3 12/30] target/hexagon: Remove unused has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
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
 David Gibson <david@gibson.dropbear.id.au>,
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
 <20210902161543.417092-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c91731f-a11c-3555-93d8-cd3379fb727e@linaro.org>
Date: Fri, 3 Sep 2021 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:21:55 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> has_work() is sysemu specific, and Hexagon target only provides
> a linux-user implementation. Remove the unused hexagon_cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/cpu.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

