Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B627C282D9
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 10:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tpmJ9-0007wZ-2k; Wed, 05 Mar 2025 05:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tpmJ7-0007wE-5I
 for qemu-riscv@nongnu.org; Wed, 05 Mar 2025 05:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tpmJ4-0008HA-Su
 for qemu-riscv@nongnu.org; Wed, 05 Mar 2025 05:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741171732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zi8TYJXIRo742efp9c9ooVWub5kQoW1rshzUifHHiLE=;
 b=fFckvk4aPz+3YS5uI9VGpbRQT3EkEBqL/H4FuV/QBM/Ybs/kgZp/nbb/l6VK9PZCnN8dkt
 KZnw7L4ErSqyKRsiE2J6/qqaMvBjddPD0+tuOmaugwIvQUbci5sQ2UcmrJF+zsM5+2dcid
 tR6RpZDLv+KA9yCXkxwhZ1PPwM4srRQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-_zLiWsXyMsy3sIbQxyla5A-1; Wed, 05 Mar 2025 05:48:40 -0500
X-MC-Unique: _zLiWsXyMsy3sIbQxyla5A-1
X-Mimecast-MFC-AGG-ID: _zLiWsXyMsy3sIbQxyla5A_1741171720
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-390f7db84faso3391145f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Mar 2025 02:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741171719; x=1741776519;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zi8TYJXIRo742efp9c9ooVWub5kQoW1rshzUifHHiLE=;
 b=WPFRVBN8+pSC97AeWCAowSKPXkY7qYflk4UmwfhJ0qobhkG3QbUDvKJXuvrspX6Qv3
 g7NCSNFRFXJe0z92N5cUTk5xybDThHfJvPw0ciuESvYUhMvSmTVbnFRj0/D6/tA+hIb5
 S2PMew1kOswNVmvENpvAUQEeZlcldZoC16CsGXMkvXRSIWUTlD2cgg1zHEAwA2MB1yom
 Vu3dpXwpx2s9MC5iB9I8t26i2dxBihCq5t3r1GyA3wESr3/frBWUQryIvRuatPnaFsAn
 VZOi2f53qOPtLOwXw5Zr1VeKAfzdrbfYB/2v+AMxGKysH/oik7qeJ3Iz080N32HATsan
 lIrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSNYRE/c98eUB4qntAXAVH1RE+h+CijvHM9iTc6Zmkymu+iAY9R206JiGgU9ZcR0OV2cuhuSYmBhft@nongnu.org
X-Gm-Message-State: AOJu0Yy3TVH948RW8WpoPwQjzPLQz/Y0Y93AOLJMbLt1Xy8VwlxX/OK6
 3zK/Zo38+Zd3FMvKy+xBZRSBhECHx2dGFWVrrsCSQlP+efKZ7eeTB/Tmty6BETusu2ttBOXTTIN
 FeHFE2faihiLlKUYD7V7SBqBbKeAcEF3fHdFmYh9zvGXzCQDHENXe
X-Gm-Gg: ASbGncv1amCp0X2p1uMAXcEcnDlD9vNFQoZAu7AvR6/3l+w6cybb0BTajfYXB0cCp8G
 gXwpOR5W7tBk99APlPkBJmJMBNdTo8v7yrG2vxJMgLV8mS7jTRS0s2wInttFO4e/vHqw/6+jrTN
 tjFj2RsDjHnAk2LH+gP2FT+va+wChimqHDcjwVJP4QO0Mrdqe+dDFsYEoTetKL9E4b8U2ID2I9h
 ukWS2zLWiwv7UqehqIx2LZmgJEvqpXlOD+9ge5Ivu97xeKwbbyA7tH95e2yAddR6jlwNsUCJKej
 I1f5AwtXWreRUPD/VpcSMBKCHy+ZET1pAZ+JnxT+rczTxrc=
X-Received: by 2002:a5d:6dad:0:b0:390:ffd0:4142 with SMTP id
 ffacd0b85a97d-3911f75678emr2074810f8f.26.1741171719299; 
 Wed, 05 Mar 2025 02:48:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF13bvT2KclFDloxNTKHqsSxYG2XrIVTfGNufYvBcJ2j2xre42KXInvZX0V1h5isjkOCnaB1w==
X-Received: by 2002:a5d:6dad:0:b0:390:ffd0:4142 with SMTP id
 ffacd0b85a97d-3911f75678emr2074797f8f.26.1741171718912; 
 Wed, 05 Mar 2025 02:48:38 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de.
 [109.42.51.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484452asm20816071f8f.61.2025.03.05.02.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:48:38 -0800 (PST)
Message-ID: <2aadca2b-f889-477d-88ed-dc030f576c24@redhat.com>
Date: Wed, 5 Mar 2025 11:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about/emulation: Fix broken link
To: Santiago Monserrat Campanello <santimonserr@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu, mjt@tls.msk.ru,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250305102632.91376-1-santimonserr@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250305102632.91376-1-santimonserr@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Z8khRQm7s24sITi_XEJ16jGC5Qu0w8tVnpAR9QFWWc_1741171720
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 05/03/2025 11.26, Santiago Monserrat Campanello wrote:
> semihosting link to risc-v changed
> 
> Signed-off-by: Santiago Monserrat Campanello <santimonserr@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2717
> ---
> the original one linked it's still accesible on
> https://github.com/riscv-non-isa/riscv-semihosting/blob/0.2/riscv-semihosting-spec.adoc
> ---
>   docs/about/emulation.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> index 3bc3579434..a72591ee4d 100644
> --- a/docs/about/emulation.rst
> +++ b/docs/about/emulation.rst
> @@ -171,7 +171,7 @@ for that architecture.
>       - Unified Hosting Interface (MD01069)
>     * - RISC-V
>       - System and User-mode
> -    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
> +    - https://github.com/riscv-non-isa/riscv-semihosting/blob/main/riscv-semihosting.adoc
>     * - Xtensa
>       - System
>       - Tensilica ISS SIMCALL

Reviewed-by: Thomas Huth <thuth@redhat.com>


