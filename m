Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9252CC28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:30:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tru3l-0004Z1-0u; Tue, 11 Mar 2025 03:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru3f-0004Uc-1h
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:29:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru3b-0007zU-2o
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:29:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso13614015e9.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741678179; x=1742282979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nhHodvfz83K8okGx6PVYNh8AahNsL56U7T1i1KJXP8w=;
 b=m5xG9pBEiVzpvIatcuV+3HwH00Oc2fLcWvbMYRcUD+83avFAke+vhQRCapRJBnz3NA
 AGg92Pf9Pk443SodEm5BGO6RFQ8vP8OFSCrt1XjYLa5jkmKYK7lNT7/VBSIkZrCbLD7q
 1AAqU98wChtVvULZyx+WuzNVpwPC0Qay0o0CKWWRiujx+upahwe1zugLUEaP/nROssXr
 tixN7YqKVLCfR4GGXFYexPxG4gDYvMd/zmdwFpWWYnynMxaJwuHjEEaIt+qDSI7f7iqp
 9zQ+G2Mf3u+6M5BQo2UHdVpDj97OSzRVkEKXntjo0+C9GXZKa5eVP3VenW3mD9thAO5i
 bvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741678179; x=1742282979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nhHodvfz83K8okGx6PVYNh8AahNsL56U7T1i1KJXP8w=;
 b=PrMc2I6CwWSOqlhYteqE+1s9PIEEoLZelxpBm1VQOy6Su5xv/McCTNJF+3A5Or5TjS
 C4xt8IxHxqxkKMaYScdbTFqYBQzDfSzQEL/0nJtIWVO48+kbkrXViZhQjWgDeL8elVyq
 Svvs+ZsFzXQ8aLzyK0YIh4a+kA3NrCWH78ZgZaQyLwNkbxWCdJ0DwbxcqiRUKW4NPL0C
 FyZaEC+mavxHMAE/rq0mGL81WS727lgLC/8HQJhxpoHubWodfxXJlm7Q1kGXibhO+lA1
 v7seviVFC5er8QbC08FtxIUI0B6OSzkObqsXHEXhVvTctAMwrHLYS/y3reCqXfLwCxml
 A9Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPiSmUsOJrtEmQoZIDLTd73fkImakVSYAIzPb+VUJVBbwjgGIuhxxmdsHzy6ZEGUEipMyqVNIEfC2E@nongnu.org
X-Gm-Message-State: AOJu0YxNk1xgAkVga+/Dk9HXPACbDWZGfSKSbaXxikt/XmJgyD3ccGOf
 Y7AuZpVO3fomytCOLQe4YH4lGeHqT8ggztgY8xk9AsR60vaWp+TgW/gTepscDS8=
X-Gm-Gg: ASbGncshalXbxT7WzpjAX5y0uvjb6aHQNbjB+T/f2RxPTu6VIjJSBn4jMlF9sBZrbgi
 l4rrFeNUOn5BTxLX8+21mAqsLH1svtJewlgoMfLrXRDWQveTDr+6CMf4QXjx+USxvlqokcJRc82
 VJzSBJXD+Tvux/w6Ny/NH1lCujgtkXwdbBfi1zlUJFnuAzHjMlMGCuoKtWa3Fy0U2MKCFwxPLFL
 GDRJ3zQiGJPW+cu91KUUTFUgOLbwM/P9kuPMUjId/Y7R5eqNbXWistRwnnD/bUEPoe7JKcbIX3O
 kqZj3F9l9f5BeT9qWY14RVOXjJ7IxVHNtoyARzFzmf6laqx7WoRWlGr4NeApPobM8my1KSOE2th
 Y8TTqBSoTANIW
X-Google-Smtp-Source: AGHT+IGCQ0WPIofxeMF6qiP5Neb98oKIcffSaO1IosDf7UGuxLQbtl0ssdei0czfpoqguWEGtKCbYA==
X-Received: by 2002:a05:600c:3545:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-43c5a600909mr128191755e9.7.1741678179189; 
 Tue, 11 Mar 2025 00:29:39 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceed32e64sm89167575e9.5.2025.03.11.00.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:29:38 -0700 (PDT)
Message-ID: <2aa408e2-a412-4eb6-b589-1bc2f5ac145a@linaro.org>
Date: Tue, 11 Mar 2025 08:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 11/3/25 05:08, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

I didn't follow this direction because Richard had a preference
on removing unnecessary inlined functions:
https://lore.kernel.org/qemu-devel/9151205a-13d3-401e-b403-f9195cdb1a45@linaro.org/

> ---
>   include/exec/ram_addr.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 7c011fadd11..098fccb5835 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -342,7 +342,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
>           }
>       }
>   
> -    xen_hvm_modified_memory(start, length);
> +    if (xen_enabled()) {
> +        xen_hvm_modified_memory(start, length);
> +    }
>   }


