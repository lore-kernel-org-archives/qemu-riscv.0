Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F7FC07CA9
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 13:44:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8hL4-0003Kc-S6; Thu, 30 Nov 2023 08:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hL1-0003JO-Ak
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:44:19 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hKy-00007V-QF
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 08:44:19 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-332d5c852a0so549013f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Nov 2023 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701351854; x=1701956654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0mf7eH2hS0c3P4+d2fQms4pu9zEXfWtMcluTCO73qZ4=;
 b=Kb0D+W6N2pXVuspbqnI1pqIRZzF2I9isGEZqNI0L8VO3Ho4A3mHS89GVpti9KxWe6X
 78f+sUMcV1sL5g8qohmf43MNIcycdp5/wuoXp4tEPjzhBQcOpHYPQPpM1I9b9jmblwz+
 7lXM9mJMrs0V4/6+u4Jc2rgNOkY3b3iTngG6htkIdgO71Uv75Ch2TX5jDQKIznmr1wmK
 jSCTIQrVGhIxEqZpHvsO8hvCKz0IsX9lQlrYPMpaK9pC7yLzk8Om4GNladoKxeeeeSp0
 hBELycLzphfZaBRUHYIb+SY7cD75zFG0iwl4zj7/IKlemiKkfMH/Ml6ApaolXfoalVk+
 F04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701351854; x=1701956654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0mf7eH2hS0c3P4+d2fQms4pu9zEXfWtMcluTCO73qZ4=;
 b=w+CmiHizP8b4QAX00hB+IWUqZOhEl7RV/ulyzddYZJfJcBXwHyQENeAnhc9JVffpIE
 8mfs6WkpdPBI4TvIyxob3QUZT0cU9eHT774Gx1Cs8ZsX54IPCCvpttEjBQyKCeaYVeHS
 f41Mdz6pNlRcbNExecarcCxrjH5QtDTl9F/kPR0iLIjc9f9wfUAyta8FgZWSSyqjUqgX
 AdHtjGKvzL4v3CRrn6Cog3rQRMPRJGBkV8zN0MT7L6kTwcLR6fYKSWc11RyYBMpoSllA
 JOugovFKtMmHuDVlXOAB6wf26JeF1LM8mPDRL8xzkqPakxawLY4mNADO7a2X6rRZCnfv
 RtvA==
X-Gm-Message-State: AOJu0Yzgd/RI+4G3SWUcVp+rh6+asVIgxLVwEqMkv8WpIGdPH7D2VGmh
 Xtj4XuFIjCBOl1dGMUKQWYGCag==
X-Google-Smtp-Source: AGHT+IFUGjlT2U8pG1QuxMF95YCA0GrMa8IF7sX8GSSN6+0zFOCS7e4DUVfFAG6PfrkSgylNqNXNlw==
X-Received: by 2002:adf:ff88:0:b0:333:a2f:e674 with SMTP id
 j8-20020adfff88000000b003330a2fe674mr6201850wrr.25.1701351854659; 
 Thu, 30 Nov 2023 05:44:14 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 cw18-20020a056000091200b00332fa6cc8acsm1576506wrb.87.2023.11.30.05.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:44:14 -0800 (PST)
Message-ID: <01ebd72d-affc-4b03-b491-f40964520f1c@linaro.org>
Date: Thu, 30 Nov 2023 14:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] system/cpus: rename qemu_global_mutex to qemu_bql
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Stefan,

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The APIs using qemu_global_mutex now follow the Big QEMU Lock (BQL)
> nomenclature. It's a little strange that the actual QemuMutex variable
> that embodies the BQL is called qemu_global_mutex instead of qemu_bql.
> Rename it for consistency.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   system/cpus.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/system/cpus.c b/system/cpus.c
> index eb24a4db8e..138720a540 100644
> --- a/system/cpus.c
> +++ b/system/cpus.c
> @@ -65,7 +65,7 @@
>   
>   #endif /* CONFIG_LINUX */
>   
> -static QemuMutex qemu_global_mutex;
> +static QemuMutex qemu_bql;

I thought we were using _cond/_sem/_mutex suffixes, but
this is not enforced:

$ git grep -hE 'Qemu(Cond|Mutex|Semaphore) [a-zA-Z]' \
   | sed -e 's/static //' -e 's/extern //' -e 's/^ *//' \
   | sort -u
QemuCond comp_done_cond;
QemuCond cond;
QemuCond decomp_done_cond;
QemuCond event_complete_cond;
QemuCond exclusive_cond;
QemuCond exclusive_resume;
QemuCond fwnmi_machine_check_interlock_cond;
QemuCond handle_apdu_cond;
QemuCond init_done_cond;    /* is thread initialization done? */
QemuCond key_cond;
QemuCond mutex_cond;
QemuCond page_cond;
QemuCond page_request_cond;
QemuCond qemu_cpu_cond;
QemuCond qemu_pause_cond;
QemuCond qemu_work_cond;
QemuCond request_cond;
QemuCond reset_cond;
QemuCond thr_cond;
QemuCond thread_cond;
QemuCond worker_stopped;
QemuMutex active_timers_lock;
QemuMutex aio_context_list_lock;
QemuMutex bitmap_mutex;
QemuMutex blkio_lock;
QemuMutex chr_write_lock;
QemuMutex cmdq_mutex;
QemuMutex colo_compare_mutex;
QemuMutex comp_done_lock;
QemuMutex counts_mutex;
QemuMutex decomp_done_lock;
QemuMutex dirty_bitmap_mutex;
QemuMutex dirtylimit_mutex;
QemuMutex error_mutex;
QemuMutex event_list_mutex;
QemuMutex event_mtx;
QemuMutex evlock;
QemuMutex free_page_lock;
QemuMutex global_mutex;
QemuMutex gnt_lock;
QemuMutex handle_apdu_mutex;
QemuMutex handlers_mutex;
QemuMutex init_done_lock;
QemuMutex intp_mutex; /* protect the intp_list IRQ state */
QemuMutex io_mutex;
QemuMutex iommu_lock;
QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
QemuMutex job_mutex;
QemuMutex key_mutex;
QemuMutex kml_slots_lock;
QemuMutex lock;
QemuMutex m;
QemuMutex map_client_list_lock;
QemuMutex migration_threads_lock;
QemuMutex mon_fdsets_lock;
QemuMutex mon_lock;
QemuMutex monitor_lock;
QemuMutex mutex;
QemuMutex output_mutex;
QemuMutex page_mutex;
QemuMutex page_request_mutex;
QemuMutex pending_out_mutex;
QemuMutex port_lock;
QemuMutex postcopy_prio_thread_mutex;
QemuMutex qemu_cpu_list_lock;
QemuMutex qemu_file_lock;
QemuMutex qemu_global_mutex;
QemuMutex qemu_sigp_mutex;
QemuMutex qjack_shutdown_lock;
QemuMutex qmp_queue_lock;
QemuMutex queue_mutex;
QemuMutex queued_requests_lock; /* protects queued_requests */
QemuMutex ram_block_discard_disable_mutex;
QemuMutex rcu_registry_lock;
QemuMutex rcu_sync_lock;
QemuMutex readdir_mutex_L;
QemuMutex reqs_lock;
QemuMutex requests_lock;
QemuMutex rp_mutex;    /* We send replies from multiple threads */
QemuMutex rsp_mutex;
QemuMutex rx_queue_lock;
QemuMutex sigbus_mutex;
QemuMutex sint_routes_mutex;
QemuMutex src_page_req_mutex;
QemuMutex start_lock;
QemuMutex target_fd_trans_lock;
QemuMutex thr_mutex;
QemuMutex thread_lock;
QemuMutex vdev_mutex;
QemuMutex vmstop_lock;
QemuMutex vreader_mutex; /* and guest_apdu_list mutex */
QemuMutex work_mutex;
QemuMutex xen_timers_lock;
QemuMutex yank_lock;
QemuSemaphore channels_ready;
QemuSemaphore colo_exit_sem;
QemuSemaphore colo_incoming_sem;
QemuSemaphore init_done_sem; /* is thread init done? */
QemuSemaphore pause_sem;
QemuSemaphore postcopy_pause_sem;
QemuSemaphore postcopy_pause_sem_dst;
QemuSemaphore postcopy_pause_sem_fast_load;
QemuSemaphore postcopy_pause_sem_fault;
QemuSemaphore postcopy_qemufile_dst_done;
QemuSemaphore postcopy_qemufile_src_sem;
QemuSemaphore rate_limit_sem;
QemuSemaphore rp_pong_acks;
QemuSemaphore rp_sem;
QemuSemaphore sem;
QemuSemaphore sem_sync;
QemuSemaphore sem_thread;
QemuSemaphore wait_unplug_sem;

So:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


