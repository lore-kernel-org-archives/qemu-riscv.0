Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox9He-0006Si-Oh
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 11:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9HJ-0006MN-HE
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:04:18 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9H3-00052s-1Z
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:03:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso9374446wmo.1
 for <qemu-riscv@nongnu.org>; Mon, 21 Nov 2022 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSUeMmCg94RK7l3nVd8QwBc1ocqYyvzzlsrJFKkg9ss=;
 b=rwrJBIMg7+ggaBprHg6ahbtvFFuQVBk4ztyzTnkjF04XI1yOeQ/0a7pcxBGAPa6ION
 FgrU2He2IOgtDvSo7EjJB5AuvAwmkoupiKv5HPEUTzJiponMdjBxEFVa+pcLavdGGnYP
 s1x3eqSqMlIL+DbnoeFWsE3KpzoExPSBwWqYYaagNsQMVBFbsZJMA08bzSzZAUylMUAC
 6LYVoMsNziTzhukEv5IRhPJ9L435hneL9C9bwfv5GdoTkDrgLMToYYa49gVAwn4Fh9Bk
 cog1Rva9mckLEc14xFjs/Eue29nrO3/P15u1BQDnjpuZlgXWerKVBtHCj+Jky2aCr4ec
 eKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSUeMmCg94RK7l3nVd8QwBc1ocqYyvzzlsrJFKkg9ss=;
 b=Uio0ilCN6mMscHsOxn2XhvU/ymXIpSgdVkYgJvhliqNbsEqH0aY22BG7UZK8OUwvaC
 7MS80hNehcX1dNKBJfQPiclLVWkBgAuXDwayxmhpbd7JzVjzfvUv14lNteZER0rdJAVM
 NKgkyFXkEAjih8Y8q/SEIwT/9xyZvkx0XpwhEost7Fh2N+RRTRaYZ7/izcIOm5A78+r3
 G6Z9msgWYDnoGAAPJt4l30jOPTwRAGCujSA/1bNUOo1V6NMavq4StWQuXQyO0TVZvPmW
 nKkZdAJlJV7UQNbFKEqUxywS1gcFX9/GjRcLCtNDA244m/ys6kB6jazmqeH0S7QX8A/7
 H2Qw==
X-Gm-Message-State: ANoB5plPjDFB4UvAgOtdmdWIfBgU+wRfC7m4QsWeDLfTF9jeJUoDzlYl
 yy/FmYoxBoj+awkk77Sa/RE3+g==
X-Google-Smtp-Source: AA0mqf7kHkMMIoBjBnktKF+uES/hfX3Nq7uTEGOptK0+fFnMaYo0+7FDsuOpeIdciEEaOIgON44cNw==
X-Received: by 2002:a1c:6a01:0:b0:3cf:a895:a9cb with SMTP id
 f1-20020a1c6a01000000b003cfa895a9cbmr16672488wmc.96.1669046634874; 
 Mon, 21 Nov 2022 08:03:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003c6cd82596esm18691105wma.43.2022.11.21.08.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:03:53 -0800 (PST)
Message-ID: <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
Date: Mon, 21 Nov 2022 17:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com,
 hreitz@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org,
 peterx@redhat.com, david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn,
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 16:04:20 -0000

On 21/11/22 15:36, Peter Maydell wrote:
> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Tweak the semantic patch to drop redundant parenthesis around the
>> return expression.
>>
>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>> manually.
>>
>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>> manually.
>>
>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>> manually.
>>
>> Whitespace in fuse_reply_iov() tidied up manually.
>>
>> checkpatch.pl complains "return of an errno should typically be -ve"
>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>> it visible to checkpatch.pl.
>>
>> checkpatch.pl complains "return is not a function, parentheses are not
>> required" three times for target/mips/tcg/dsp_helper.c.  False
>> positives.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
>>   .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>   .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
> [snip long list of other mips test files]
> 
>>   328 files changed, 989 insertions(+), 2099 deletions(-)
> 
> This patch seems to almost entirely be huge because of these
> mips test case files. Are they specific to QEMU or are they
> effectively a 3rd-party import that it doesn't make sense
> to make local changes to?

They are imported and will unlikely be modified.

