Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F11E7B610
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:02:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo1VY-0006p2-ON; Wed, 04 Oct 2023 09:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1qny5t-0007C9-PG
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:23:01 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1qny5r-0005ad-6e
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:23:01 -0400
X-CSE-ConnectionGUID: 3OUoq3u4TWyZh+KZuiulMA==
X-CSE-MsgGUID: /VWieQ1qRZWHw8NrySNurQ==
X-IronPort-RemoteIP: 209.85.166.197
X-IronPort-MID: 311761998
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n5pE6a3HNrnrWt/YdPbD5W1zkn2cJEfYwER7XKvMYLTBsI5bp2cBz
 GEcXzzXa//bM2SnfI11aNu1phsP7J6ExtAxTFRlqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0b/656yE6jPnULlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhXgsaQr414rZ8Ek05ayq5GtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN01K3wxJNYFptpIEFNOt
 t8qNTEQajWq0rfeLLKTEoGAh+wmJcjveYIb4zRulGCGS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHN3w2PUuojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzOKlVMviem8YLI5fPTNe/pUk3/Bv
 1j0wETmUjcAJee51CC8pyfEaujn2HmTtJgpPKS18+MvmlyIzXI7DhoQWl2m5/6jhSaDt8l3L
 kUV/m8vqfF3+hX6EZ/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsF1attPROWBcKeAEX
IronPort-HdrOrdr: A9a23:EWryfK0JyoknNCBFhqt7TwqjBH4kLtp133Aq2lEZdPWaSL3+qy
 mLpoVn6faSskdsZJhAo6H7BEDkexnhHPFOkOss1NuZLWzbUS6TXf5fBOjZskbd8k/Fh5dgPM
 5bGsAUeb7N5BpB/L7HCWGDc+rIq+P3lpxA692uq0tFfEVBR5slwT1EKju2JGVLeSguP+tGKH
 Ne3KZ6TvibFEj/ov7UOpDNZYejm+H2
X-Talos-CUID: 9a23:yk/QwGyXr2nSXmTS3sH8BgVPPf0iaybAkEvvMn24SkVbVbyITXq5rfY=
X-Talos-MUID: 9a23:hYGbdAkfQaJUEUeENsRLdnolCvhp7p33EXo/rrUZ6++eJBdWJi2k2WE=
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 05:22:55 -0400
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-351592255ceso11320275ab.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1696411374; x=1697016174; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BV+C949xhkFKZqvVI3hGe8/xW89n4x3Df+hRb88uucQ=;
 b=LjnRecA4j0J2V9fEEMiEIjkKftfu/jDXrnTwYVUprrntfy0UyW8tLkgcUlajIUtq4C
 i5S7ytYYOXQ+so2YyFOISyrad2n2g5Ir65C/uitvR6jaJDh5lQUv4ckQGcU8bXXLQuZs
 Eps64bkCvzpddtEWoR62VC/WDK6U6dfqFgx+5gVlhheSjtdHgWHcHB60xqvw2h+rAxzT
 +SJciZ8hFS/Z+2qD6imJXBgwSKZYzpHhY1XPt4U2EqG2svW4IUu8uEaYTjN15LKKLc2r
 O3nB92X6TPVY4UySjoGTAuEjOlfm/taLOWdUmwHAjJ1OxSetHEkp6RokvuET8p/t/l8H
 6iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696411374; x=1697016174;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BV+C949xhkFKZqvVI3hGe8/xW89n4x3Df+hRb88uucQ=;
 b=gb3ZpT6S5U3C5ndmTkxImniONpOxbbnel+OqVD1snbh2VCXZiBFf7KjJA9luPo8QL8
 1FEfobKcvh/c4LxmQwg4BbmlJ+G64xd7v8teXez7H5u83Ui2l/MBL80k/vRmvPrXGFkg
 hNoWTTS/6ppKnXU67zb468cK3gtU8LKdvd+vzsDekNv2m/5N3UbZDQx7pLFeHH73VJOy
 zgbmjeOlW9sSei/lm6fpH4TP9XN+JaKeRNI+gkmwAF3hILkd7xa/EFGCtxvzBt8NBjHj
 o+a6jI8CJWhoY19IYGYp199OlpGQ1CN+T+sJ7BZtvu482INjhy/e3fEfar1ADQINqyZj
 sdEQ==
X-Gm-Message-State: AOJu0YxVHwGLAN3ywz54APcR7ZYsxuKgbgBHUoNTzblgyv70tDWvA1dk
 cLSx9IKluf7qahtIsGQkt2506a0M4Ky0wMIW18Hpa69qlRkK2ySPZ/pRJ0N3tmDiZ423em6QrMA
 fDPj0PABZeWhNV2jbrQAudpdfyT0lFQ==
X-Received: by 2002:a05:6e02:13d0:b0:351:526a:4ac with SMTP id
 v16-20020a056e0213d000b00351526a04acmr1696808ilj.2.1696411374761; 
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsq6wbxMsmgt516UTp/VPMAzJSnUNAq5mXSN6YN7sSwBcbUH5/lsYS9MVQq9zofugs44phHw==
X-Received: by 2002:a05:6e02:13d0:b0:351:526a:4ac with SMTP id
 v16-20020a056e0213d000b00351526a04acmr1696803ilj.2.1696411374492; 
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a92cbca000000b003514e467230sm874100ilq.19.2023.10.04.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
Date: Wed, 4 Oct 2023 05:22:48 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 04/13] fuzz: Correct invalid mentions of 'softmmu' by
 'system'
Message-ID: <20231004092238.twpzrp4iwvhx7mp4@mozz.bu.edu>
References: <20231004090629.37473-1-philmd@linaro.org>
 <20231004090629.37473-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004090629.37473-5-philmd@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Oct 2023 09:01:40 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Thank you

On 231004 1106, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/fuzz/fuzz.h | 4 ++--
>  softmmu/memory.c        | 2 +-
>  tests/qtest/fuzz/fuzz.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
> index 21d1362d65..7da0bc3d7e 100644
> --- a/tests/qtest/fuzz/fuzz.h
> +++ b/tests/qtest/fuzz/fuzz.h
> @@ -49,13 +49,13 @@ typedef struct FuzzTarget {
>  
>  
>      /*
> -     * Returns the arguments that are passed to qemu/softmmu init(). Freed by
> +     * Returns the arguments that are passed to qemu/system init(). Freed by
>       * the caller.
>       */
>      GString *(*get_init_cmdline)(struct FuzzTarget *);
>  
>      /*
> -     * will run once, prior to running qemu/softmmu init.
> +     * will run once, prior to running qemu/system init.
>       * eg: set up shared-memory for communication with the child-process
>       * Can be NULL
>       */
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 234bd7b116..fa1c99f9ba 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3638,7 +3638,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
>  }
>  
>  /*
> - * Support softmmu builds with CONFIG_FUZZ using a weak symbol and a stub for
> + * Support system builds with CONFIG_FUZZ using a weak symbol and a stub for
>   * the fuzz_dma_read_cb callback
>   */
>  #ifdef CONFIG_FUZZ
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 3bedb81b32..9b9c9f9c36 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -207,7 +207,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>          fuzz_target->pre_vm_init();
>      }
>  
> -    /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
> +    /* Run QEMU's system main with the fuzz-target dependent arguments */
>      cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>      g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
>                             getenv("QTEST_LOG") ? "" : "-qtest-log none");
> -- 
> 2.41.0
> 

