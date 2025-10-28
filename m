Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A460DCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:43:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoeH-0005l8-EO; Tue, 28 Oct 2025 14:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDoe0-0005Mh-9e
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodU-0005qo-IQ
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761676891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8JE18ZjWlXAwit2z6n1ZQ+ilWG96/G0LXLXd9ZdiuWQ=;
 b=SqguFJiKy6Oph/x6PuQLRqUIP2swjYEB4Z8faCY47wlYff3wL7SqXsLk7BCiSal2z+kQUf
 axBxs/TgOB1KIU/ZjnbuXvYZ98o8AOIc1HBUUUzVXn/CO1J03N0mCb1rZ1CMxEAnlXxS1X
 0u9TaGxa7U4uZ9k80UcBN8WblRGGy+I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-_8gaJ4T7NRuCshi6n0sbtQ-1; Tue, 28 Oct 2025 14:41:30 -0400
X-MC-Unique: _8gaJ4T7NRuCshi6n0sbtQ-1
X-Mimecast-MFC-AGG-ID: _8gaJ4T7NRuCshi6n0sbtQ_1761676890
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8a15d36c209so985658885a.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676890; x=1762281690;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JE18ZjWlXAwit2z6n1ZQ+ilWG96/G0LXLXd9ZdiuWQ=;
 b=bEl7S+pZPr9hgaGxkTR049QyNhv3+7yxcDQtYhZ6CIS4gvKdyJeXW3ssoTlGl1ubcg
 Y7zkqe/VvzGp+dKakRCaKPDSeDxMa28jFR6PaZYmkaeDnvUJdJN9mnw71lJXO3AT26TZ
 d8eELyR4dYXlsBKz5m5FrUVnVLYATGGNIktgg4uYwsca7piI8Er7pfqHIlTTpDhkqQHJ
 MvfsG48wy+aF7GncyKtAK0xQ2aAxD8tTBFe+RwKJB/3cLrfxOG1xwc3/oPwmDQvliBng
 piH4MDdKApewp+xMUChTptD4KONQJOrMICT5239+cT1Y0Qw44v+suQ9TE94ct/AHxnZk
 8tuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY/czBcOrAKvkR4RJ+4ab+xfMB4r3Hto1eHVVGStXrSoHzSwudXbuSEi2C8ajDktrmc6aCIc77MfGM@nongnu.org
X-Gm-Message-State: AOJu0YywXhDNIgw57uZ369/xSh/qnH7kgdpoIe4nHpd7WqKKnsW/4MaP
 3cAfCvQCaC33pyzMLLt/0jrjCYkl4AISDlBkV9prUMjFE7axDmzgkeuD8AZU+vHs24s3NEgTWhC
 mFjTKFhfCL09YgWUsTqfS2EEfxKYXc4mNddGITUOZLBkfDL0xjxnZE/fp
X-Gm-Gg: ASbGncsg5oDKK9REktHE4JXFz5YxokcSaQ5HFgX7CeLzRnIJnZu+xQBPQQJYWReCSsH
 JZaQNPs+72hoj893v9D/dKep5M2PCgJZpNmcC3K4BD8R9lvEqrAec5NtTUinZiefZilTDCom+Ed
 HJgyiNYhvKrfnA75gYXVlEfTwvGO2t7/C8CQW+J6kTitzhYbVbt1fC53Zv4l1E4SbMMtaLMZCy+
 8Zpi/dygEBZXxeKTIyKYeMuy2qN4sIHgbKbjl6jPjgZ1AHEtBx/fA9c/ONZ0wLIGTPUok8g/JgP
 1vsPs5e8N9y0jxltVYmUECK/MOmBHqmEzqL2J4O355ggi5dawUcK/Rn17w7fwf0l5NY=
X-Received: by 2002:a05:6214:27c9:b0:798:acd7:2bb with SMTP id
 6a1803df08f44-88009c0b912mr1037256d6.51.1761676889842; 
 Tue, 28 Oct 2025 11:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz9dR8kMz0S6e9uZHFhtek7D0C9LNsYC8wL8XSrLNCkrY/ca31qp0JCfvcV3KUiInSS0KnQg==
X-Received: by 2002:a05:6214:27c9:b0:798:acd7:2bb with SMTP id
 6a1803df08f44-88009c0b912mr1036896d6.51.1761676889279; 
 Tue, 28 Oct 2025 11:41:29 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc49204dfsm82115346d6.30.2025.10.28.11.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:41:28 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v3 12/25] migration/ram: Use memory_region_get_address()
Message-ID: <aQEOV2ucE_77LJD7@x1.local>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-13-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251028181300.41475-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BYNGeaZFetF48ttCVHL5K-mMeGeuHvH60b0LLN3El5Y_1761676890
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Oct 28, 2025 at 07:12:46PM +0100, Philippe Mathieu-Daudé wrote:
> MemoryRegion::addr is private data of MemoryRegion, use
> memory_region_get_address() to access it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


